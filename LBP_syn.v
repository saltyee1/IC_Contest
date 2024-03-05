
module LBP_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, N68, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83,
         N84, N85, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N176, N177, N178, N179, N180, N181, N224,
         N225, N226, N227, N228, N229, N230, N231, N232, N233, N234, N235,
         N236, N237, N270, N271, N272, N273, N274, N275, N276, N277, N278,
         N279, N280, N281, N282, N283, N316, N317, N318, N319, N320, N321,
         N322, N323, N324, N325, N326, N327, N328, N329, N357, N424, n8, n10,
         n11, n13, n14, n15, n16, n18, n19, n21, n31, n33, n35, n38, n40, n42,
         n44, n46, n48, n52, n55, n57, n59, n61, n64, n65, n66, n67, n69, n70,
         n71, n72, n73, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n110, n111, n113, n114, n115,
         n116, n117, n118, n119, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n154, n155, n156,
         n158, n159, n161, n162, n163, n164, n165, n166, n167, n168, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         N546, N545, N544, N543, N542, N541, N540, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n272, n274, n276, n278, n280, n282, n284, n286,
         n288, n290, n292, n294, n296, n298, n300, n301, n304, n306, n308,
         n310, n313, n314, n316, n317, n318, n319, n320, n322, n324, n326,
         n328, n330, n332, n334, n336, n338, n340, n342, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428;
  wire   [13:0] address;
  wire   [3:0] counter;
  wire   [7:0] gray_data_reg;
  wire   [7:0] working_data;
  wire   [1:0] ns;

  OAI211X2 U167 ( .A0(n426), .A1(address[2]), .B0(n427), .C0(n111), .Y(n107)
         );
  LBP_DW01_inc_0 r357 ( .A({address[13:8], n369}), .SUM({N167, N166, N165, 
        N164, N163, N162, N161}) );
  LBP_DW01_inc_1 r354 ( .A({address[6:2], n426, n419}), .SUM({N85, N84, N83, 
        N82, N81, N80, N79}) );
  LBP_DW01_inc_2 add_71_aco ( .A({N546, N545, N544, N543, N542, N541, N540}), 
        .SUM({N78, N77, N76, N75, N74, N73, N72}) );
  DFFRX1 \gray_data_reg_reg[7]  ( .D(gray_data[7]), .CK(clk), .RN(n371), .QN(
        n269) );
  DFFRX1 \working_data_reg[6]  ( .D(n128), .CK(clk), .RN(n372), .Q(
        working_data[6]), .QN(n268) );
  DFFRX1 \gray_data_reg_reg[6]  ( .D(gray_data[6]), .CK(clk), .RN(n373), .Q(
        gray_data_reg[6]) );
  DFFRX1 \working_data_reg[7]  ( .D(n127), .CK(clk), .RN(n372), .Q(
        working_data[7]) );
  DFFRX1 \gray_data_reg_reg[0]  ( .D(gray_data[0]), .CK(clk), .RN(n371), .Q(
        gray_data_reg[0]) );
  DFFRX1 \gray_data_reg_reg[5]  ( .D(gray_data[5]), .CK(clk), .RN(n371), .QN(
        n264) );
  DFFRX1 \gray_data_reg_reg[3]  ( .D(gray_data[3]), .CK(clk), .RN(n371), .QN(
        n265) );
  DFFRX1 \gray_data_reg_reg[1]  ( .D(gray_data[1]), .CK(clk), .RN(n371), .QN(
        n252) );
  DFFRX1 \gray_data_reg_reg[4]  ( .D(gray_data[4]), .CK(clk), .RN(n371), .Q(
        gray_data_reg[4]) );
  DFFRX1 \gray_data_reg_reg[2]  ( .D(gray_data[2]), .CK(clk), .RN(n371), .Q(
        gray_data_reg[2]) );
  DFFRX1 \working_data_reg[0]  ( .D(n134), .CK(clk), .RN(n372), .Q(
        working_data[0]), .QN(n266) );
  DFFRX1 \working_data_reg[1]  ( .D(n133), .CK(clk), .RN(n372), .Q(
        working_data[1]) );
  DFFRX1 \working_data_reg[3]  ( .D(n131), .CK(clk), .RN(n372), .Q(
        working_data[3]) );
  DFFRX1 \working_data_reg[5]  ( .D(n129), .CK(clk), .RN(n372), .Q(
        working_data[5]) );
  DFFRX1 \working_data_reg[2]  ( .D(n132), .CK(clk), .RN(n372), .Q(
        working_data[2]) );
  DFFRX1 \working_data_reg[4]  ( .D(n130), .CK(clk), .RN(n372), .Q(
        working_data[4]) );
  DFFRX1 \sum_reg[7]  ( .D(n170), .CK(clk), .RN(n372), .QN(n256) );
  DFFRX1 \sum_reg[6]  ( .D(n171), .CK(clk), .RN(n372), .QN(n258) );
  DFFRX1 \sum_reg[2]  ( .D(n175), .CK(clk), .RN(n372), .QN(n262) );
  DFFRX1 \sum_reg[4]  ( .D(n173), .CK(clk), .RN(n372), .QN(n257) );
  DFFRX1 \sum_reg[0]  ( .D(n177), .CK(clk), .RN(n372), .QN(n259) );
  DFFRX1 \sum_reg[3]  ( .D(n174), .CK(clk), .RN(n372), .QN(n261) );
  DFFRX1 \sum_reg[1]  ( .D(n176), .CK(clk), .RN(n372), .QN(n260) );
  DFFSX1 \col_reg[0]  ( .D(n142), .CK(clk), .SN(n371), .Q(n418), .QN(n164) );
  DFFRX1 \counter_reg[3]  ( .D(n180), .CK(clk), .RN(n401), .Q(n263), .QN(n165)
         );
  DFFRX1 \gray_addr_reg_reg[1]  ( .D(N317), .CK(clk), .RN(n371), .QN(n342) );
  DFFRX1 \gray_addr_reg_reg[2]  ( .D(N318), .CK(clk), .RN(n401), .QN(n340) );
  DFFRX1 \gray_addr_reg_reg[3]  ( .D(N319), .CK(clk), .RN(n372), .QN(n338) );
  DFFRX1 \gray_addr_reg_reg[4]  ( .D(N320), .CK(clk), .RN(n372), .QN(n336) );
  DFFRX1 \gray_addr_reg_reg[5]  ( .D(N321), .CK(clk), .RN(n401), .QN(n334) );
  DFFRX1 \gray_addr_reg_reg[6]  ( .D(N322), .CK(clk), .RN(n372), .QN(n332) );
  DFFRX1 \gray_addr_reg_reg[8]  ( .D(N324), .CK(clk), .RN(n371), .QN(n330) );
  DFFRX1 \gray_addr_reg_reg[9]  ( .D(N325), .CK(clk), .RN(n371), .QN(n328) );
  DFFRX1 \gray_addr_reg_reg[10]  ( .D(N326), .CK(clk), .RN(n371), .QN(n326) );
  DFFRX1 \gray_addr_reg_reg[11]  ( .D(N327), .CK(clk), .RN(n371), .QN(n324) );
  DFFRX1 \gray_addr_reg_reg[12]  ( .D(N328), .CK(clk), .RN(n371), .QN(n322) );
  DFFRX1 \gray_addr_reg_reg[13]  ( .D(N329), .CK(clk), .RN(n371), .QN(n320) );
  DFFRX1 \col_reg[3]  ( .D(n145), .CK(clk), .RN(n401), .Q(address[10]), .QN(
        n161) );
  DFFRX1 \counter_reg[1]  ( .D(n179), .CK(clk), .RN(n401), .Q(counter[1]), 
        .QN(n167) );
  DFFRX1 \col_reg[4]  ( .D(n146), .CK(clk), .RN(n401), .Q(address[11]), .QN(
        n385) );
  DFFRX1 \counter_reg[2]  ( .D(n178), .CK(clk), .RN(n401), .Q(counter[2]), 
        .QN(n166) );
  DFFRX1 \row_reg[6]  ( .D(n135), .CK(clk), .RN(n401), .Q(address[6]), .QN(
        n151) );
  DFFRX1 \row_reg[4]  ( .D(n137), .CK(clk), .RN(n401), .Q(address[4]), .QN(
        n379) );
  DFFRX1 \row_reg[3]  ( .D(n138), .CK(clk), .RN(n401), .Q(address[3]), .QN(
        n154) );
  DFFRX1 \row_reg[5]  ( .D(n136), .CK(clk), .RN(n401), .Q(address[5]), .QN(
        n152) );
  DFFRXL \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(n401), .Q(n417), .QN(n149) );
  DFFRXL \sum_reg[5]  ( .D(n172), .CK(clk), .RN(n401), .QN(n428) );
  EDFFHQX1 \lbp_addr_reg_reg[12]  ( .D(N282), .E(n373), .CK(clk), .Q(n430) );
  EDFFHQX1 \lbp_addr_reg_reg[11]  ( .D(N281), .E(n401), .CK(clk), .Q(n431) );
  EDFFHQX1 \lbp_addr_reg_reg[8]  ( .D(N278), .E(n373), .CK(clk), .Q(n300) );
  EDFFHQX1 \lbp_addr_reg_reg[7]  ( .D(N277), .E(n401), .CK(clk), .Q(n301) );
  EDFFHQX1 \lbp_addr_reg_reg[6]  ( .D(N276), .E(n401), .CK(clk), .Q(n304) );
  EDFFHQX1 \lbp_addr_reg_reg[5]  ( .D(N275), .E(n401), .CK(clk), .Q(n306) );
  EDFFHQX1 \lbp_addr_reg_reg[4]  ( .D(N274), .E(n401), .CK(clk), .Q(n308) );
  EDFFHQX1 \lbp_addr_reg_reg[3]  ( .D(N273), .E(n401), .CK(clk), .Q(n310) );
  EDFFHQX1 \lbp_addr_reg_reg[2]  ( .D(N272), .E(n401), .CK(clk), .Q(n314) );
  EDFFHQX1 \lbp_addr_reg_reg[1]  ( .D(N271), .E(n401), .CK(clk), .Q(n317) );
  EDFFHQX1 \lbp_addr_reg_reg[0]  ( .D(N270), .E(n401), .CK(clk), .Q(n319) );
  EDFFHQX1 \lbp_addr_reg_reg[13]  ( .D(N283), .E(n401), .CK(clk), .Q(n313) );
  EDFFHQX1 \lbp_addr_reg_reg[10]  ( .D(N280), .E(n401), .CK(clk), .Q(n316) );
  EDFFHQX1 \lbp_addr_reg_reg[9]  ( .D(N279), .E(n401), .CK(clk), .Q(n318) );
  DFFSX1 \gray_addr_reg_reg[0]  ( .D(N316), .CK(clk), .SN(n401), .QN(n254) );
  DFFSX1 \gray_addr_reg_reg[7]  ( .D(N323), .CK(clk), .SN(n401), .QN(n255) );
  DFFRX2 \counter_reg[0]  ( .D(n181), .CK(clk), .RN(n401), .Q(counter[0]), 
        .QN(n168) );
  DFFSX2 \row_reg[0]  ( .D(n141), .CK(clk), .SN(n401), .Q(n419), .QN(N154) );
  DFFRX2 \row_reg[2]  ( .D(n139), .CK(clk), .RN(n401), .Q(address[2]), .QN(
        n155) );
  DFFRX2 \row_reg[1]  ( .D(n140), .CK(clk), .RN(n401), .Q(n426), .QN(n156) );
  DFFRX2 \col_reg[2]  ( .D(n144), .CK(clk), .RN(n401), .Q(address[9]), .QN(
        n162) );
  DFFRX2 \col_reg[1]  ( .D(n143), .CK(clk), .RN(n401), .Q(address[8]), .QN(
        n163) );
  DFFRX2 \col_reg[6]  ( .D(n148), .CK(clk), .RN(n401), .Q(address[13]), .QN(
        n158) );
  DFFRX2 \col_reg[5]  ( .D(n147), .CK(clk), .RN(n401), .Q(address[12]), .QN(
        n159) );
  DFFRX1 \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(n401), .Q(n415), .QN(n150) );
  OR2X1 U267 ( .A(n150), .B(n149), .Y(n253) );
  CLKMX2X2 U268 ( .A(n363), .B(n348), .S0(n364), .Y(n267) );
  OAI211XL U269 ( .A0(n385), .A1(n413), .B0(n96), .C0(n97), .Y(N320) );
  NOR2X2 U270 ( .A(n417), .B(n150), .Y(n19) );
  MXI2XL U271 ( .A(N164), .B(address[10]), .S0(n363), .Y(n356) );
  MXI3XL U272 ( .A(address[10]), .B(N164), .C(N178), .S0(n364), .S1(n347), .Y(
        n355) );
  AO21XL U273 ( .A0(n381), .A1(address[10]), .B0(n382), .Y(N178) );
  AND2XL U274 ( .A(address[10]), .B(N424), .Y(N543) );
  NOR2XL U275 ( .A(address[9]), .B(address[13]), .Y(n117) );
  AO21XL U276 ( .A0(address[2]), .A1(n426), .B0(address[3]), .Y(n400) );
  NOR4XL U277 ( .A(n72), .B(address[2]), .C(n73), .D(n426), .Y(n71) );
  OR2XL U278 ( .A(n426), .B(n419), .Y(n374) );
  NOR2XL U279 ( .A(address[2]), .B(n419), .Y(n110) );
  OAI2BB1XL U280 ( .A0N(n419), .A1N(n426), .B0(n374), .Y(N155) );
  INVX12 U281 ( .A(n255), .Y(gray_addr[7]) );
  INVX12 U282 ( .A(n254), .Y(gray_addr[0]) );
  INVXL U283 ( .A(n318), .Y(n272) );
  INVX12 U284 ( .A(n272), .Y(lbp_addr[9]) );
  INVXL U285 ( .A(n316), .Y(n274) );
  INVX12 U286 ( .A(n274), .Y(lbp_addr[10]) );
  INVXL U287 ( .A(n313), .Y(n276) );
  INVX12 U288 ( .A(n276), .Y(lbp_addr[13]) );
  INVXL U289 ( .A(n319), .Y(n278) );
  INVX12 U290 ( .A(n278), .Y(lbp_addr[0]) );
  INVXL U291 ( .A(n317), .Y(n280) );
  INVX12 U292 ( .A(n280), .Y(lbp_addr[1]) );
  INVXL U293 ( .A(n314), .Y(n282) );
  INVX12 U294 ( .A(n282), .Y(lbp_addr[2]) );
  INVXL U295 ( .A(n310), .Y(n284) );
  INVX12 U296 ( .A(n284), .Y(lbp_addr[3]) );
  INVXL U297 ( .A(n308), .Y(n286) );
  INVX12 U298 ( .A(n286), .Y(lbp_addr[4]) );
  INVXL U299 ( .A(n306), .Y(n288) );
  INVX12 U300 ( .A(n288), .Y(lbp_addr[5]) );
  INVXL U301 ( .A(n304), .Y(n290) );
  INVX12 U302 ( .A(n290), .Y(lbp_addr[6]) );
  INVXL U303 ( .A(n301), .Y(n292) );
  INVX12 U304 ( .A(n292), .Y(lbp_addr[7]) );
  INVXL U305 ( .A(n300), .Y(n294) );
  INVX12 U306 ( .A(n294), .Y(lbp_addr[8]) );
  INVXL U307 ( .A(n431), .Y(n296) );
  INVX12 U308 ( .A(n296), .Y(lbp_addr[11]) );
  INVXL U309 ( .A(n430), .Y(n298) );
  INVX12 U310 ( .A(n298), .Y(lbp_addr[12]) );
  INVX6 U311 ( .A(reset), .Y(n401) );
  OR2X1 U312 ( .A(n416), .B(n256), .Y(n433) );
  INVX12 U313 ( .A(n433), .Y(lbp_data[7]) );
  OR2X1 U314 ( .A(n416), .B(n258), .Y(n434) );
  INVX12 U315 ( .A(n434), .Y(lbp_data[6]) );
  OR2X1 U316 ( .A(n416), .B(n428), .Y(n435) );
  INVX12 U317 ( .A(n435), .Y(lbp_data[5]) );
  OR2X1 U318 ( .A(n416), .B(n257), .Y(n436) );
  INVX12 U319 ( .A(n436), .Y(lbp_data[4]) );
  OR2X1 U320 ( .A(n416), .B(n261), .Y(n437) );
  INVX12 U321 ( .A(n437), .Y(lbp_data[3]) );
  OR2X1 U322 ( .A(n370), .B(n262), .Y(n438) );
  INVX12 U323 ( .A(n438), .Y(lbp_data[2]) );
  OR2X1 U324 ( .A(n370), .B(n260), .Y(n439) );
  INVX12 U325 ( .A(n439), .Y(lbp_data[1]) );
  OR2X1 U326 ( .A(n370), .B(n259), .Y(n440) );
  INVX12 U327 ( .A(n440), .Y(lbp_data[0]) );
  INVX12 U328 ( .A(n320), .Y(gray_addr[13]) );
  INVX12 U329 ( .A(n322), .Y(gray_addr[12]) );
  INVX12 U330 ( .A(n324), .Y(gray_addr[11]) );
  INVX12 U331 ( .A(n326), .Y(gray_addr[10]) );
  INVX12 U332 ( .A(n328), .Y(gray_addr[9]) );
  INVX12 U333 ( .A(n330), .Y(gray_addr[8]) );
  INVX12 U334 ( .A(n332), .Y(gray_addr[6]) );
  INVX12 U335 ( .A(n334), .Y(gray_addr[5]) );
  INVX12 U336 ( .A(n336), .Y(gray_addr[4]) );
  INVX12 U337 ( .A(n338), .Y(gray_addr[3]) );
  INVX12 U338 ( .A(n340), .Y(gray_addr[2]) );
  INVX12 U339 ( .A(n342), .Y(gray_addr[1]) );
  BUFX12 U340 ( .A(n432), .Y(lbp_valid) );
  OAI2BB2XL U341 ( .B0(n71), .B1(n416), .A0N(N357), .A1N(n52), .Y(n432) );
  INVX12 U342 ( .A(n253), .Y(finish) );
  AND2X2 U343 ( .A(n414), .B(n370), .Y(n429) );
  INVX16 U344 ( .A(n429), .Y(gray_req) );
  OAI32XL U345 ( .A0(n256), .A1(n365), .A2(n19), .B0(n412), .B1(n33), .Y(n170)
         );
  OAI32XL U346 ( .A0(n257), .A1(n19), .A2(n44), .B0(n33), .B1(n404), .Y(n173)
         );
  OAI32XL U347 ( .A0(n258), .A1(n19), .A2(n35), .B0(n33), .B1(n407), .Y(n171)
         );
  CLKXOR2X2 U348 ( .A(n364), .B(n363), .Y(n347) );
  AOI2BB2XL U349 ( .B0(gray_ready), .B1(n14), .A0N(n8), .A1N(n149), .Y(n13) );
  NOR3X1 U350 ( .A(n365), .B(n165), .C(n414), .Y(n89) );
  NAND3X1 U351 ( .A(n52), .B(counter[2]), .C(n165), .Y(n38) );
  CLKBUFX3 U352 ( .A(counter[1]), .Y(n364) );
  CLKBUFX3 U353 ( .A(n416), .Y(n370) );
  CLKBUFX3 U354 ( .A(n371), .Y(n373) );
  INVX3 U355 ( .A(n365), .Y(n412) );
  INVX3 U356 ( .A(n368), .Y(n410) );
  CLKBUFX3 U357 ( .A(n371), .Y(n372) );
  CLKINVX1 U358 ( .A(n19), .Y(n416) );
  CLKINVX1 U359 ( .A(n52), .Y(n414) );
  CLKBUFX3 U360 ( .A(n401), .Y(n371) );
  CLKINVX1 U361 ( .A(n44), .Y(n404) );
  NOR2X1 U362 ( .A(n46), .B(n38), .Y(n44) );
  CLKINVX1 U363 ( .A(n35), .Y(n407) );
  NOR2X1 U364 ( .A(n409), .B(n38), .Y(n35) );
  OA21XL U365 ( .A0(n70), .A1(n64), .B0(gray_req), .Y(n65) );
  NOR2BX2 U366 ( .AN(N424), .B(n412), .Y(n90) );
  NOR2X2 U367 ( .A(n89), .B(n90), .Y(n78) );
  OAI22XL U368 ( .A0(n61), .A1(n259), .B0(n403), .B1(n33), .Y(n177) );
  CLKINVX1 U369 ( .A(n61), .Y(n403) );
  OAI21XL U370 ( .A0(n46), .A1(n57), .B0(n370), .Y(n61) );
  OAI22XL U371 ( .A0(n405), .A1(n33), .B0(n59), .B1(n260), .Y(n176) );
  CLKINVX1 U372 ( .A(n59), .Y(n405) );
  OAI21XL U373 ( .A0(n42), .A1(n57), .B0(n370), .Y(n59) );
  OAI22XL U374 ( .A0(n406), .A1(n33), .B0(n40), .B1(n428), .Y(n172) );
  CLKINVX1 U375 ( .A(n40), .Y(n406) );
  OAI21XL U376 ( .A0(n38), .A1(n42), .B0(n370), .Y(n40) );
  OAI22XL U377 ( .A0(n402), .A1(n33), .B0(n48), .B1(n261), .Y(n174) );
  CLKINVX1 U378 ( .A(n48), .Y(n402) );
  OAI31XL U379 ( .A0(n38), .A1(counter[0]), .A2(counter[1]), .B0(n370), .Y(n48) );
  OAI22XL U380 ( .A0(n408), .A1(n33), .B0(n55), .B1(n262), .Y(n175) );
  CLKINVX1 U381 ( .A(n55), .Y(n408) );
  OAI21XL U382 ( .A0(n409), .A1(n57), .B0(n370), .Y(n55) );
  CLKBUFX3 U383 ( .A(n31), .Y(n365) );
  NOR2X1 U384 ( .A(n414), .B(n8), .Y(n31) );
  NAND4X1 U385 ( .A(n412), .B(n426), .C(n427), .D(n110), .Y(n108) );
  NAND2X1 U386 ( .A(n52), .B(n8), .Y(n64) );
  CLKINVX1 U387 ( .A(n89), .Y(n413) );
  CLKINVX1 U388 ( .A(N85), .Y(n420) );
  CLKINVX1 U389 ( .A(n73), .Y(n427) );
  MXI3X1 U390 ( .A(n369), .B(N161), .C(n164), .S0(n364), .S1(n347), .Y(n349)
         );
  CLKBUFX3 U391 ( .A(n81), .Y(n366) );
  NOR2X1 U392 ( .A(n263), .B(n414), .Y(n81) );
  CLKINVX1 U393 ( .A(N84), .Y(n421) );
  CLKBUFX3 U394 ( .A(n21), .Y(n368) );
  NOR2X1 U395 ( .A(n412), .B(N424), .Y(n21) );
  NOR2X1 U396 ( .A(n417), .B(n415), .Y(n14) );
  MXI2X1 U397 ( .A(N161), .B(n369), .S0(n363), .Y(n350) );
  CLKINVX1 U398 ( .A(n70), .Y(n409) );
  CLKBUFX3 U399 ( .A(n80), .Y(n367) );
  NOR2X1 U400 ( .A(n52), .B(n14), .Y(n80) );
  CLKINVX1 U401 ( .A(N80), .Y(n425) );
  CLKINVX1 U402 ( .A(N82), .Y(n423) );
  CLKINVX1 U403 ( .A(N81), .Y(n424) );
  CLKINVX1 U404 ( .A(N83), .Y(n422) );
  AO21X1 U405 ( .A0(n417), .A1(n8), .B0(n415), .Y(ns[1]) );
  AND4X1 U406 ( .A(n159), .B(n385), .C(n117), .D(n161), .Y(n16) );
  NAND4X1 U407 ( .A(n163), .B(n16), .C(n418), .D(n419), .Y(n72) );
  NOR2X2 U408 ( .A(n415), .B(n149), .Y(n52) );
  NAND4X1 U409 ( .A(n151), .B(n152), .C(n379), .D(n154), .Y(n73) );
  OAI211X1 U410 ( .A0(n10), .A1(n11), .B0(n253), .C0(n13), .Y(ns[0]) );
  NAND4BBXL U411 ( .AN(n154), .BN(n379), .C(address[2]), .D(n18), .Y(n10) );
  NAND4X1 U412 ( .A(n163), .B(n369), .C(n15), .D(n16), .Y(n11) );
  AO22X1 U413 ( .A0(gray_data[7]), .A1(n19), .B0(working_data[7]), .B1(n370), 
        .Y(n127) );
  AO22X1 U414 ( .A0(gray_data[6]), .A1(n19), .B0(working_data[6]), .B1(n370), 
        .Y(n128) );
  AO22X1 U415 ( .A0(gray_data[5]), .A1(n19), .B0(working_data[5]), .B1(n370), 
        .Y(n129) );
  AO22X1 U416 ( .A0(gray_data[4]), .A1(n19), .B0(working_data[4]), .B1(n370), 
        .Y(n130) );
  AO22X1 U417 ( .A0(gray_data[3]), .A1(n19), .B0(working_data[3]), .B1(n370), 
        .Y(n131) );
  AO22X1 U418 ( .A0(gray_data[2]), .A1(n19), .B0(working_data[2]), .B1(n370), 
        .Y(n132) );
  AO22X1 U419 ( .A0(gray_data[1]), .A1(n19), .B0(working_data[1]), .B1(n370), 
        .Y(n133) );
  AO22X1 U420 ( .A0(gray_data[0]), .A1(n19), .B0(working_data[0]), .B1(n370), 
        .Y(n134) );
  OR2X1 U421 ( .A(address[8]), .B(n369), .Y(n380) );
  NAND2X2 U422 ( .A(N68), .B(n52), .Y(n33) );
  OAI32X1 U423 ( .A0(n64), .A1(counter[2]), .A2(n409), .B0(n166), .B1(n65), 
        .Y(n178) );
  OAI221XL U424 ( .A0(n379), .A1(n78), .B0(n410), .B1(n422), .C0(n83), .Y(N327) );
  AOI22X1 U425 ( .A0(N158), .A1(n367), .B0(N235), .B1(n366), .Y(n83) );
  MX3XL U426 ( .A(N158), .B(address[4]), .C(N83), .S0(n364), .S1(n267), .Y(
        N235) );
  MXI3X1 U427 ( .A(address[13]), .B(N167), .C(N181), .S0(n364), .S1(n347), .Y(
        n361) );
  MXI3X1 U428 ( .A(address[11]), .B(N165), .C(N179), .S0(n364), .S1(n347), .Y(
        n357) );
  OAI221XL U429 ( .A0(n151), .A1(n78), .B0(n410), .B1(n420), .C0(n79), .Y(N329) );
  AOI22X1 U430 ( .A0(N160), .A1(n367), .B0(N237), .B1(n366), .Y(n79) );
  MX3XL U431 ( .A(N160), .B(address[6]), .C(N85), .S0(n364), .S1(n267), .Y(
        N237) );
  CLKBUFX3 U432 ( .A(n418), .Y(n369) );
  AOI22X1 U433 ( .A0(N165), .A1(n90), .B0(N179), .B1(n367), .Y(n97) );
  NAND2X1 U434 ( .A(N228), .B(n366), .Y(n96) );
  MXI2X1 U435 ( .A(n357), .B(n358), .S0(counter[0]), .Y(N228) );
  OAI211X1 U436 ( .A0(n158), .A1(n413), .B0(n92), .C0(n93), .Y(N322) );
  AOI22X1 U437 ( .A0(N167), .A1(n90), .B0(N181), .B1(n367), .Y(n93) );
  NAND2X1 U438 ( .A(N230), .B(n366), .Y(n92) );
  MXI2X1 U439 ( .A(n361), .B(n362), .S0(counter[0]), .Y(N230) );
  OAI2BB1X1 U440 ( .A0N(n67), .A1N(n263), .B0(n69), .Y(n180) );
  OR4X1 U441 ( .A(n64), .B(n409), .C(n263), .D(n166), .Y(n69) );
  OAI21XL U442 ( .A0(counter[2]), .A1(n64), .B0(n65), .Y(n67) );
  AOI221XL U443 ( .A0(N154), .A1(n426), .B0(n419), .B1(address[2]), .C0(n365), 
        .Y(n111) );
  OAI22XL U444 ( .A0(n167), .A1(gray_req), .B0(n66), .B1(n64), .Y(n179) );
  AND2X2 U445 ( .A(n42), .B(n46), .Y(n66) );
  OAI22XL U446 ( .A0(n168), .A1(gray_req), .B0(counter[0]), .B1(n64), .Y(n181)
         );
  OAI221XL U447 ( .A0(n164), .A1(n107), .B0(N154), .B1(n412), .C0(n108), .Y(
        N277) );
  OAI221XL U448 ( .A0(n163), .A1(n107), .B0(n156), .B1(n412), .C0(n108), .Y(
        N278) );
  OAI221XL U449 ( .A0(n162), .A1(n107), .B0(n155), .B1(n412), .C0(n108), .Y(
        N279) );
  OAI221XL U450 ( .A0(n161), .A1(n107), .B0(n154), .B1(n412), .C0(n108), .Y(
        N280) );
  OAI221XL U451 ( .A0(n385), .A1(n107), .B0(n379), .B1(n412), .C0(n108), .Y(
        N281) );
  OAI221XL U452 ( .A0(n159), .A1(n107), .B0(n152), .B1(n412), .C0(n108), .Y(
        N282) );
  OAI221XL U453 ( .A0(n158), .A1(n107), .B0(n151), .B1(n412), .C0(n108), .Y(
        N283) );
  OAI221XL U454 ( .A0(n156), .A1(n78), .B0(n410), .B1(n425), .C0(n86), .Y(N324) );
  AOI22X1 U455 ( .A0(N155), .A1(n367), .B0(N232), .B1(n366), .Y(n86) );
  MX3XL U456 ( .A(N155), .B(n426), .C(N80), .S0(n364), .S1(n267), .Y(N232) );
  OAI221XL U457 ( .A0(n155), .A1(n78), .B0(n410), .B1(n424), .C0(n85), .Y(N325) );
  AOI22X1 U458 ( .A0(N156), .A1(n367), .B0(N233), .B1(n366), .Y(n85) );
  MX3XL U459 ( .A(N156), .B(address[2]), .C(N81), .S0(n364), .S1(n267), .Y(
        N233) );
  OAI221XL U460 ( .A0(n154), .A1(n78), .B0(n410), .B1(n423), .C0(n84), .Y(N326) );
  AOI22X1 U461 ( .A0(N157), .A1(n367), .B0(N234), .B1(n366), .Y(n84) );
  MX3XL U462 ( .A(N157), .B(address[3]), .C(N82), .S0(n364), .S1(n267), .Y(
        N234) );
  OAI221XL U463 ( .A0(n152), .A1(n78), .B0(n410), .B1(n421), .C0(n82), .Y(N328) );
  AOI22X1 U464 ( .A0(N159), .A1(n367), .B0(N236), .B1(n366), .Y(n82) );
  MX3XL U465 ( .A(N159), .B(address[5]), .C(N84), .S0(n364), .S1(n267), .Y(
        N236) );
  NAND4X2 U466 ( .A(address[8]), .B(address[13]), .C(address[9]), .D(n106), 
        .Y(N424) );
  NOR4X1 U467 ( .A(n159), .B(n385), .C(n161), .D(n369), .Y(n106) );
  OAI211X1 U468 ( .A0(n161), .A1(n413), .B0(n98), .C0(n99), .Y(N319) );
  AOI22X1 U469 ( .A0(N164), .A1(n90), .B0(N178), .B1(n367), .Y(n99) );
  NAND2X1 U470 ( .A(N227), .B(n366), .Y(n98) );
  MXI2X1 U471 ( .A(n355), .B(n356), .S0(counter[0]), .Y(N227) );
  OAI211X1 U472 ( .A0(n159), .A1(n413), .B0(n94), .C0(n95), .Y(N321) );
  AOI22X1 U473 ( .A0(N166), .A1(n90), .B0(N180), .B1(n367), .Y(n95) );
  NAND2X1 U474 ( .A(N229), .B(n366), .Y(n94) );
  MXI2X1 U475 ( .A(n359), .B(n360), .S0(counter[0]), .Y(N229) );
  MXI3X1 U476 ( .A(address[12]), .B(N166), .C(N180), .S0(n364), .S1(n347), .Y(
        n359) );
  OAI211X1 U477 ( .A0(n410), .A1(n419), .B0(n87), .C0(n88), .Y(N323) );
  AOI22X1 U478 ( .A0(N154), .A1(n367), .B0(N231), .B1(n366), .Y(n88) );
  AOI2BB1X1 U479 ( .A0N(n78), .A1N(N154), .B0(n14), .Y(n87) );
  MX3XL U480 ( .A(N154), .B(n419), .C(N79), .S0(n364), .S1(n267), .Y(N231) );
  AO22X1 U481 ( .A0(n412), .A1(address[13]), .B0(N78), .B1(n365), .Y(n148) );
  OAI21X2 U482 ( .A0(n114), .A1(n115), .B0(n412), .Y(n113) );
  NOR4X1 U483 ( .A(n155), .B(n73), .C(n426), .D(n419), .Y(n115) );
  AND4X1 U484 ( .A(n116), .B(n156), .C(n16), .D(n427), .Y(n114) );
  NOR3X1 U485 ( .A(n163), .B(n155), .C(n369), .Y(n116) );
  CLKINVX1 U486 ( .A(n118), .Y(n411) );
  OAI31XL U487 ( .A0(address[2]), .A1(n119), .A2(n73), .B0(n412), .Y(n118) );
  XNOR2X1 U488 ( .A(N154), .B(n156), .Y(n119) );
  NAND4X1 U489 ( .A(n166), .B(n167), .C(n168), .D(n263), .Y(n8) );
  NOR2BX1 U490 ( .AN(n363), .B(counter[0]), .Y(n348) );
  OAI211X1 U491 ( .A0(n163), .A1(n413), .B0(n102), .C0(n103), .Y(N317) );
  NAND2X1 U492 ( .A(N225), .B(n366), .Y(n102) );
  AOI22X1 U493 ( .A0(N162), .A1(n90), .B0(N176), .B1(n367), .Y(n103) );
  MXI2X1 U494 ( .A(n351), .B(n352), .S0(counter[0]), .Y(N225) );
  OAI211X1 U495 ( .A0(n162), .A1(n413), .B0(n100), .C0(n101), .Y(N318) );
  AOI22X1 U496 ( .A0(N163), .A1(n90), .B0(N177), .B1(n367), .Y(n101) );
  NAND2X1 U497 ( .A(N226), .B(n366), .Y(n100) );
  MXI2X1 U498 ( .A(n353), .B(n354), .S0(counter[0]), .Y(N226) );
  MXI2X1 U499 ( .A(N167), .B(address[13]), .S0(n363), .Y(n362) );
  NAND3X1 U500 ( .A(n52), .B(n166), .C(n165), .Y(n57) );
  OAI22XL U501 ( .A0(N154), .A1(n368), .B0(n410), .B1(n419), .Y(n141) );
  OAI22XL U502 ( .A0(n151), .A1(n368), .B0(n410), .B1(n420), .Y(n135) );
  OAI22XL U503 ( .A0(n156), .A1(n368), .B0(n410), .B1(n425), .Y(n140) );
  OAI22XL U504 ( .A0(n152), .A1(n368), .B0(n410), .B1(n421), .Y(n136) );
  OAI22XL U505 ( .A0(n379), .A1(n368), .B0(n410), .B1(n422), .Y(n137) );
  OAI22XL U506 ( .A0(n154), .A1(n368), .B0(n410), .B1(n423), .Y(n138) );
  OAI22XL U507 ( .A0(n155), .A1(n368), .B0(n410), .B1(n424), .Y(n139) );
  MXI2X1 U508 ( .A(N166), .B(address[12]), .S0(n363), .Y(n360) );
  MXI2X1 U509 ( .A(N165), .B(address[11]), .S0(n363), .Y(n358) );
  OAI21XL U510 ( .A0(n164), .A1(n411), .B0(n113), .Y(N270) );
  OAI21XL U511 ( .A0(n163), .A1(n411), .B0(n113), .Y(N271) );
  OAI21XL U512 ( .A0(n162), .A1(n411), .B0(n113), .Y(N272) );
  OAI21XL U513 ( .A0(n161), .A1(n411), .B0(n113), .Y(N273) );
  OAI21XL U514 ( .A0(n385), .A1(n411), .B0(n113), .Y(N274) );
  OAI21XL U515 ( .A0(n159), .A1(n411), .B0(n113), .Y(N275) );
  OAI21XL U516 ( .A0(n158), .A1(n411), .B0(n113), .Y(N276) );
  MXI3X1 U517 ( .A(address[9]), .B(N163), .C(N177), .S0(n364), .S1(n347), .Y(
        n353) );
  MXI3X1 U518 ( .A(address[8]), .B(N162), .C(N176), .S0(n364), .S1(n347), .Y(
        n351) );
  NAND2X1 U519 ( .A(n104), .B(n105), .Y(N316) );
  AOI222XL U520 ( .A0(N161), .A1(n365), .B0(N224), .B1(n366), .C0(n89), .C1(
        n418), .Y(n104) );
  AOI211X1 U521 ( .A0(n164), .A1(n367), .B0(n14), .C0(n368), .Y(n105) );
  MXI2X1 U522 ( .A(n349), .B(n350), .S0(counter[0]), .Y(N224) );
  CLKBUFX3 U523 ( .A(counter[2]), .Y(n363) );
  AO22X1 U524 ( .A0(n412), .A1(address[9]), .B0(N74), .B1(n365), .Y(n144) );
  AO22X1 U525 ( .A0(n412), .A1(address[8]), .B0(N73), .B1(n365), .Y(n143) );
  AO22X1 U526 ( .A0(N77), .A1(n365), .B0(address[12]), .B1(n412), .Y(n147) );
  AO22X1 U527 ( .A0(N75), .A1(n365), .B0(address[10]), .B1(n412), .Y(n145) );
  AO22X1 U528 ( .A0(N76), .A1(n365), .B0(address[11]), .B1(n412), .Y(n146) );
  AO22X1 U529 ( .A0(n412), .A1(n369), .B0(N72), .B1(n365), .Y(n142) );
  NAND2X1 U530 ( .A(n167), .B(counter[0]), .Y(n46) );
  NAND2X1 U531 ( .A(n168), .B(counter[1]), .Y(n42) );
  MXI2X1 U532 ( .A(N163), .B(address[9]), .S0(n363), .Y(n354) );
  MXI2X1 U533 ( .A(N162), .B(address[8]), .S0(n363), .Y(n352) );
  NOR2X1 U534 ( .A(n167), .B(n168), .Y(n70) );
  NOR3X1 U535 ( .A(n152), .B(n150), .C(n151), .Y(n18) );
  NOR2X1 U536 ( .A(n156), .B(N154), .Y(n15) );
  AND2X1 U537 ( .A(n369), .B(N424), .Y(N540) );
  AND2X1 U538 ( .A(address[8]), .B(N424), .Y(N541) );
  AND2X1 U539 ( .A(address[9]), .B(N424), .Y(N542) );
  AND2X1 U540 ( .A(address[11]), .B(N424), .Y(N544) );
  AND2X1 U541 ( .A(address[12]), .B(N424), .Y(N545) );
  AND2X1 U542 ( .A(N424), .B(address[13]), .Y(N546) );
  OR2X1 U543 ( .A(n374), .B(address[2]), .Y(n375) );
  OAI2BB1X1 U544 ( .A0N(n374), .A1N(address[2]), .B0(n375), .Y(N156) );
  NOR2X1 U545 ( .A(n375), .B(address[3]), .Y(n376) );
  AO21X1 U546 ( .A0(n375), .A1(address[3]), .B0(n376), .Y(N157) );
  NAND2X1 U547 ( .A(n376), .B(n379), .Y(n377) );
  OAI21XL U548 ( .A0(n376), .A1(n379), .B0(n377), .Y(N158) );
  XNOR2X1 U549 ( .A(address[5]), .B(n377), .Y(N159) );
  NOR2X1 U550 ( .A(address[5]), .B(n377), .Y(n378) );
  XOR2X1 U551 ( .A(address[6]), .B(n378), .Y(N160) );
  OAI2BB1X1 U552 ( .A0N(n369), .A1N(address[8]), .B0(n380), .Y(N176) );
  OR2X1 U553 ( .A(n380), .B(address[9]), .Y(n381) );
  OAI2BB1X1 U554 ( .A0N(n380), .A1N(address[9]), .B0(n381), .Y(N177) );
  NOR2X1 U555 ( .A(n381), .B(address[10]), .Y(n382) );
  NAND2X1 U556 ( .A(n382), .B(n385), .Y(n383) );
  OAI21XL U557 ( .A0(n382), .A1(n385), .B0(n383), .Y(N179) );
  XNOR2X1 U558 ( .A(address[12]), .B(n383), .Y(N180) );
  NOR2X1 U559 ( .A(address[12]), .B(n383), .Y(n384) );
  XOR2X1 U560 ( .A(address[13]), .B(n384), .Y(N181) );
  NAND2BX1 U561 ( .AN(working_data[4]), .B(gray_data_reg[4]), .Y(n386) );
  OAI222XL U562 ( .A0(working_data[5]), .A1(n264), .B0(working_data[5]), .B1(
        n386), .C0(n264), .C1(n386), .Y(n387) );
  OAI222XL U563 ( .A0(gray_data_reg[6]), .A1(n387), .B0(n268), .B1(n387), .C0(
        gray_data_reg[6]), .C1(n268), .Y(n398) );
  NOR2BX1 U564 ( .AN(working_data[4]), .B(gray_data_reg[4]), .Y(n388) );
  OAI22XL U565 ( .A0(n388), .A1(n264), .B0(working_data[5]), .B1(n388), .Y(
        n396) );
  NAND2BX1 U566 ( .AN(working_data[2]), .B(gray_data_reg[2]), .Y(n394) );
  OAI2BB2XL U567 ( .B0(gray_data_reg[0]), .B1(n266), .A0N(n252), .A1N(
        working_data[1]), .Y(n389) );
  OAI21XL U568 ( .A0(working_data[1]), .A1(n252), .B0(n389), .Y(n392) );
  NOR2BX1 U569 ( .AN(working_data[2]), .B(gray_data_reg[2]), .Y(n390) );
  OAI22XL U570 ( .A0(n390), .A1(n265), .B0(working_data[3]), .B1(n390), .Y(
        n391) );
  AOI2BB2X1 U571 ( .B0(n392), .B1(n391), .A0N(n394), .A1N(n265), .Y(n393) );
  OAI221XL U572 ( .A0(working_data[3]), .A1(n394), .B0(working_data[3]), .B1(
        n265), .C0(n393), .Y(n395) );
  OAI211X1 U573 ( .A0(gray_data_reg[6]), .A1(n268), .B0(n396), .C0(n395), .Y(
        n397) );
  AO22X1 U574 ( .A0(n269), .A1(working_data[7]), .B0(n398), .B1(n397), .Y(n399) );
  OAI21XL U575 ( .A0(working_data[7]), .A1(n269), .B0(n399), .Y(N68) );
  NOR4X1 U576 ( .A(n400), .B(address[4]), .C(address[6]), .D(address[5]), .Y(
        N357) );
endmodule

