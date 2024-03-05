
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	    clk;
input   	    reset;
output reg  [13:0] 	gray_addr;
output reg        	gray_req;
input   	    gray_ready;
input   [7:0] 	gray_data;
output  reg [13:0] 	lbp_addr;
output  reg	    lbp_valid;
output  [7:0] 	lbp_data;
output  reg	    finish;


//====================================================================
//state 
parameter INIT      = 2'd0;
parameter LOAD      = 2'd1;
parameter CALCULATE = 2'd2;
parameter FINISH    = 2'd3;

reg [7:0] gray_data_reg;

reg     [6:0]   col,row; //128*128 pixel
reg     [6:0]   col_t, row_t;
reg     [1:0]   cs,ns;
reg     [7:0]   working_data;
reg     [7:0]   sum; // calculate for lbp
reg     [3:0]   counter;
wire    [13:0]  address = {col,row};
reg     [13:0]  zero_address;
wire calculate_done = (counter == 4'd8) ? 1'b1 : 1'b0;
wire load_done = (col==7'h01 && row==7'h7f) ? 1'b1 : 1'b0;
//wire bigger = (gray_data >= working_data) ? 1'b1 : 1'b0;
wire bigger = (gray_data_reg >= working_data) ? 1'b1 : 1'b0;
assign lbp_data = (cs == LOAD) ? sum : 8'd0;


always @(posedge clk or posedge reset) begin
    if(reset) begin
        gray_data_reg <= 8'b0;
    end
    else begin
        gray_data_reg <= gray_data;
    end
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        cs <= INIT;
    end
    else begin
        cs <= ns;
    end
end

always @(posedge clk or posedge reset) begin
    if (reset)
        working_data <= 8'd0;
    else if (cs == LOAD)
        working_data <= gray_data;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        row <= 7'd1;
        col <= 7'd1;
    end
    else if (cs == CALCULATE && calculate_done) begin
        col <= (col == 7'h7e) ? 7'd1 : (col + 7'd1);
        row <= (col == 7'h7e) ? (row + 7'd1) : row;
    end
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sum <= 8'd0;
        counter <= 4'd0;
    end
    else if (cs == LOAD) begin
        sum <= 8'd0;
        counter <= 4'd0;
    end
    else if (cs == CALCULATE) begin
        if (calculate_done) begin
            counter <= 4'd0;
            sum[counter-4'd1] <= (bigger) ? 1'b1 : 1'b0;
        end
        else begin
            sum[counter-4'd1] <= (bigger) ? 1'b1 : 1'b0;
            counter <= counter + 4'd1;
        end
    end    
end

always @(*) begin
    case (counter)
        4'd0 : begin
            col_t = col - 7'd1;
            row_t = row - 7'd1;
        end
        4'd1 : begin
            col_t = col;
            row_t = row - 7'd1;
        end
        4'd2 : begin
            col_t = col + 7'd1;
            row_t = row - 7'd1;
        end
        4'd3 : begin
            col_t = col - 7'd1;
            row_t = row;
        end
        4'd4 : begin
            col_t = col + 7'd1;
            row_t = row;
        end
        4'd5 : begin
            col_t = col - 7'd1;
            row_t = row + 7'd1;
        end
        4'd6 : begin
            col_t = col;
            row_t = row + 7'd1;
        end
        4'd7 : begin
            col_t = col + 7'd1;
            row_t = row + 7'd1;
        end
        default : begin
            col_t = col;
            row_t = row;
        end
    endcase
end

reg [13:0] lbp_addr_reg;
always @(posedge clk) begin
    if(!reset) begin
        if (cs == CALCULATE && counter == 4'd8) 
            lbp_addr_reg <= {row, col};
        else
            lbp_addr_reg <= zero_address;
    end
end

// always @(*) begin
//     if (cs == LOAD) begin
//         gray_addr = {row, col};
//         //lbp_addr = (col == 7'h1) ? {(row-7'h1), 7'h7e} : {row, (col-7'h1)};
//         lbp_addr = lbp_addr_reg;
//     end
//     else if (cs == CALCULATE) begin
//         lbp_addr = zero_address;
//         gray_addr = {row_t, col_t};
//     end
//     else begin
//         lbp_addr = 7'b0;
//         gray_addr = 7'b0;
//     end
// end

always @(*) begin
    lbp_addr = lbp_addr_reg;
    case (cs)
        LOAD : begin
            gray_addr = {row, col};
        end 
        CALCULATE : begin
            gray_addr = {row_t, col_t};
        end
        default: begin
            gray_addr = 7'b0;
        end
    endcase
end

always @(*) begin
    if(row == 7'h01) 
        zero_address = {7'h00, col};
    else if (row == 7'h02)
        zero_address = {7'h7f, col};
    else if (row == 7'h03)
        zero_address = {col, 7'h00};
    else if (row == 7'h04)
        zero_address = {col, 7'h7f};
    else if (row == 7'h05) begin
        case (col)
            7'd1 : zero_address = {7'h00,7'h00};
            7'd2 : zero_address = {7'h00,7'h7f};
            7'd2 : zero_address = {7'h7f,7'h00};
            7'd2 : zero_address = {7'h7f,7'h7f};
            default : zero_address = {7'h00,7'h00};
        endcase
    end
    else zero_address = {7'h00,7'h00};
end

// next state logic
always @(*) begin
    case (cs)
        INIT        : ns = (gray_ready) ? LOAD : INIT;
        LOAD        : ns = (load_done) ?  FINISH : CALCULATE;
        CALCULATE   : ns = (calculate_done) ? LOAD : CALCULATE;
        FINISH      : ns = FINISH;
    endcase
end

// output logic
always @(*) begin
    case (cs)
        INIT : begin
            gray_req = 1'b0;
            finish = 1'b0; 
            lbp_valid = 1'b0;
        end
        LOAD : begin
            gray_req = 1'b1;
            finish = 1'b0; 
            lbp_valid = (col == 7'd1 && row == 7'd1) ? 1'b0 : 1'b1; //first load can not write lbp
        end
        CALCULATE : begin
            gray_req = 1'b1;
            finish = 1'b0; 
            lbp_valid = (row <= 7'h5) ? 1'b1 : 1'b0;  //write lbp into 0 at the begining
        end
        FINISH : begin
            gray_req = 1'b0;
            finish = 1'b1; 
            lbp_valid = 1'b0;
        end
    endcase
end

//====================================================================
endmodule
