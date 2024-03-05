
module LBP_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
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
  wire   n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, N52,
         \sum[7] , N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N71, N124, N125, N126, N127, N128, N129, N130, N131, N132, N133,
         N134, N135, N136, N144, N145, N146, N147, N148, N149, N150, N263,
         N349, n7, n10, n11, n13, n15, n16, n21, n22, n23, n24, n26, n27, n28,
         n29, n31, n32, n33, n34, n36, n40, n43, n48, n50, n52, n55, n57, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n88, n89,
         n90, n91, n92, n93, n101, n102, n104, n105, n107, n108, n109, n110,
         n111, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n139, n140, n141, n142, n143, n145, n146,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, N403, N402, N401, N400, N399, N398, N397, n232,
         n233, n234, n235, n236, n238, n240, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393;
  wire   [13:0] address;
  wire   [2:0] counter;
  wire   [7:0] working_data;
  wire   [1:0] ns;
  wire   [6:0] col_t;
  wire   [6:0] row_t;

  LBP_DW01_inc_0 r352 ( .A({address[13:8], n330}), .SUM({N150, N149, N148, 
        N147, N146, N145, N144}) );
  LBP_DW01_inc_1 r348 ( .A(address[6:0]), .SUM({N71, N70, N69, N68, N67, N66, 
        N65}) );
  LBP_DW01_inc_2 add_62_aco ( .A({N403, N402, N401, N400, N399, N398, N397}), 
        .SUM({N64, N63, N62, N61, N60, N59, N58}) );
  DFFRX1 \sum_reg[7]  ( .D(n154), .CK(clk), .RN(n374), .Q(\sum[7] ) );
  DFFRX1 \sum_reg[6]  ( .D(n155), .CK(clk), .RN(n374), .QN(n387) );
  DFFRX1 \sum_reg[5]  ( .D(n156), .CK(clk), .RN(n374), .QN(n388) );
  DFFRX1 \sum_reg[4]  ( .D(n157), .CK(clk), .RN(n374), .QN(n389) );
  DFFRX1 \sum_reg[3]  ( .D(n158), .CK(clk), .RN(n374), .QN(n390) );
  DFFRX1 \sum_reg[2]  ( .D(n159), .CK(clk), .RN(n374), .QN(n391) );
  DFFRX1 \sum_reg[1]  ( .D(n160), .CK(clk), .RN(n374), .QN(n392) );
  DFFRX1 \sum_reg[0]  ( .D(n161), .CK(clk), .RN(n374), .QN(n393) );
  DFFSX1 \col_reg[0]  ( .D(n137), .CK(clk), .SN(n374), .Q(address[7]), .QN(
        n151) );
  DFFRX1 \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(n374), .Q(n386), .QN(n140) );
  DFFRX1 \col_reg[6]  ( .D(n131), .CK(clk), .RN(n374), .Q(address[13]), .QN(
        n145) );
  DFFRX1 \counter_reg[0]  ( .D(n139), .CK(clk), .RN(n374), .Q(counter[0]), 
        .QN(n153) );
  DFFRX1 \counter_reg[1]  ( .D(n123), .CK(clk), .RN(n374), .Q(counter[1]), 
        .QN(n105) );
  DFFRX1 \counter_reg[2]  ( .D(n122), .CK(clk), .RN(n374), .Q(counter[2]), 
        .QN(n152) );
  DFFRX1 \row_reg[6]  ( .D(n124), .CK(clk), .RN(n374), .Q(address[6]), .QN(
        n101) );
  DFFRX1 \row_reg[5]  ( .D(n125), .CK(clk), .RN(n374), .Q(address[5]), .QN(
        n102) );
  DFFRX1 \row_reg[4]  ( .D(n126), .CK(clk), .RN(n374), .Q(address[4]), .QN(
        n352) );
  DFFRX1 \row_reg[3]  ( .D(n130), .CK(clk), .RN(n374), .Q(address[3]), .QN(
        n104) );
  DFFRX1 \working_data_reg[0]  ( .D(n121), .CK(clk), .RN(n374), .QN(n368) );
  DFFRX1 \working_data_reg[7]  ( .D(n114), .CK(clk), .RN(n374), .Q(
        working_data[7]), .QN(n113) );
  DFFRX1 \working_data_reg[5]  ( .D(n116), .CK(clk), .RN(n374), .Q(
        working_data[5]), .QN(n111) );
  DFFRX1 \working_data_reg[3]  ( .D(n118), .CK(clk), .RN(n374), .Q(
        working_data[3]), .QN(n109) );
  DFFRX1 \working_data_reg[1]  ( .D(n120), .CK(clk), .RN(n374), .Q(
        working_data[1]), .QN(n107) );
  DFFRX1 \working_data_reg[4]  ( .D(n117), .CK(clk), .RN(n374), .Q(
        working_data[4]), .QN(n110) );
  DFFRX1 \working_data_reg[2]  ( .D(n119), .CK(clk), .RN(n374), .Q(
        working_data[2]), .QN(n108) );
  DFFRX1 \working_data_reg[6]  ( .D(n115), .CK(clk), .RN(n374), .QN(n367) );
  DFFRX1 \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(n374), .Q(n385), .QN(n141) );
  DFFRX2 \row_reg[1]  ( .D(n128), .CK(clk), .RN(n374), .Q(address[1]), .QN(
        n143) );
  DFFRX2 \row_reg[2]  ( .D(n127), .CK(clk), .RN(n374), .Q(address[2]), .QN(
        n142) );
  DFFRX2 \col_reg[5]  ( .D(n132), .CK(clk), .RN(n374), .Q(address[12]), .QN(
        n146) );
  DFFSX2 \row_reg[0]  ( .D(n129), .CK(clk), .SN(n374), .Q(address[0]), .QN(
        N130) );
  DFFRX2 \col_reg[1]  ( .D(n136), .CK(clk), .RN(n374), .Q(address[8]), .QN(
        n150) );
  DFFRX2 \col_reg[3]  ( .D(n134), .CK(clk), .RN(n374), .Q(address[10]), .QN(
        n148) );
  DFFRX2 \col_reg[2]  ( .D(n135), .CK(clk), .RN(n374), .Q(address[9]), .QN(
        n149) );
  DFFRX2 \col_reg[4]  ( .D(n133), .CK(clk), .RN(n374), .Q(address[11]), .QN(
        n346) );
  NAND2X1 U240 ( .A(n333), .B(n84), .Y(n64) );
  CLKINVX1 U241 ( .A(N132), .Y(n306) );
  MXI3X1 U242 ( .A(n307), .B(n280), .C(n281), .S0(n327), .S1(n326), .Y(
        row_t[1]) );
  CLKINVX1 U243 ( .A(N131), .Y(n307) );
  MXI3X1 U244 ( .A(n306), .B(n282), .C(n283), .S0(n327), .S1(n326), .Y(
        row_t[2]) );
  AOI22X1 U245 ( .A0(address[0]), .A1(n340), .B0(row_t[0]), .B1(n334), .Y(n232) );
  AOI22X1 U246 ( .A0(address[1]), .A1(n340), .B0(row_t[1]), .B1(n334), .Y(n233) );
  AOI22X1 U247 ( .A0(address[2]), .A1(n340), .B0(row_t[2]), .B1(n334), .Y(n234) );
  OR2X1 U248 ( .A(n332), .B(n387), .Y(n235) );
  OR2X1 U249 ( .A(n141), .B(n140), .Y(n236) );
  AND2XL U250 ( .A(N349), .B(address[13]), .Y(N403) );
  NAND4XL U251 ( .A(n90), .B(address[8]), .C(n346), .D(n148), .Y(n88) );
  NOR4XL U252 ( .A(address[9]), .B(address[8]), .C(address[13]), .D(
        address[12]), .Y(n91) );
  MXI2X1 U253 ( .A(address[2]), .B(N67), .S0(n325), .Y(n282) );
  INVX12 U254 ( .A(n235), .Y(lbp_data[6]) );
  INVXL U255 ( .A(n400), .Y(n238) );
  INVX12 U256 ( .A(n238), .Y(gray_addr[4]) );
  OAI2BB2XL U257 ( .B0(n346), .B1(n333), .A0N(col_t[4]), .A1N(n334), .Y(n400)
         );
  INVXL U258 ( .A(n399), .Y(n240) );
  INVX12 U259 ( .A(n240), .Y(gray_addr[5]) );
  OAI2BB2XL U260 ( .B0(n146), .B1(n333), .A0N(col_t[5]), .A1N(n334), .Y(n399)
         );
  INVX12 U261 ( .A(n232), .Y(gray_addr[7]) );
  INVX12 U262 ( .A(n233), .Y(gray_addr[8]) );
  INVX12 U263 ( .A(n234), .Y(gray_addr[9]) );
  OR2XL U264 ( .A(address[1]), .B(address[0]), .Y(n347) );
  MXI3XL U265 ( .A(N131), .B(address[1]), .C(N66), .S0(n325), .S1(n327), .Y(
        n281) );
  MXI2XL U266 ( .A(address[1]), .B(N66), .S0(n325), .Y(n280) );
  XNOR2XL U267 ( .A(address[1]), .B(N130), .Y(n92) );
  INVX6 U268 ( .A(reset), .Y(n374) );
  BUFX12 U269 ( .A(n419), .Y(lbp_addr[0]) );
  OAI222XL U270 ( .A0(n70), .A1(n151), .B0(n330), .B1(n61), .C0(n78), .C1(n340), .Y(n419) );
  OR2X1 U271 ( .A(n332), .B(n388), .Y(n421) );
  INVX12 U272 ( .A(n421), .Y(lbp_data[5]) );
  BUFX12 U273 ( .A(n401), .Y(gray_addr[3]) );
  OAI2BB2XL U274 ( .B0(n148), .B1(n333), .A0N(col_t[3]), .A1N(n334), .Y(n401)
         );
  BUFX12 U275 ( .A(n404), .Y(gray_addr[0]) );
  OAI2BB2XL U276 ( .B0(n151), .B1(n332), .A0N(col_t[0]), .A1N(n334), .Y(n404)
         );
  BUFX12 U277 ( .A(n420), .Y(lbp_valid) );
  OAI211X1 U278 ( .A0(n60), .A1(n333), .B0(n61), .C0(n62), .Y(n420) );
  OR2X1 U279 ( .A(n332), .B(n389), .Y(n422) );
  INVX12 U280 ( .A(n422), .Y(lbp_data[4]) );
  OR2X1 U281 ( .A(n332), .B(n390), .Y(n423) );
  INVX12 U282 ( .A(n423), .Y(lbp_data[3]) );
  CLKINVX3 U283 ( .A(n337), .Y(n332) );
  BUFX12 U284 ( .A(n402), .Y(gray_addr[2]) );
  OAI2BB2XL U285 ( .B0(n149), .B1(n333), .A0N(col_t[2]), .A1N(n334), .Y(n402)
         );
  BUFX12 U286 ( .A(n406), .Y(lbp_addr[13]) );
  OAI221XL U287 ( .A0(n145), .A1(n64), .B0(n101), .B1(n61), .C0(n79), .Y(n406)
         );
  BUFX12 U288 ( .A(n394), .Y(gray_addr[13]) );
  OAI2BB2XL U289 ( .B0(n101), .B1(n332), .A0N(row_t[6]), .A1N(n334), .Y(n394)
         );
  BUFX12 U290 ( .A(n413), .Y(lbp_addr[6]) );
  OAI211X1 U291 ( .A0(n145), .A1(n70), .B0(n71), .C0(n72), .Y(n413) );
  BUFX12 U292 ( .A(n407), .Y(lbp_addr[12]) );
  OAI221XL U293 ( .A0(n146), .A1(n64), .B0(n102), .B1(n61), .C0(n80), .Y(n407)
         );
  BUFX12 U294 ( .A(n395), .Y(gray_addr[12]) );
  OAI2BB2XL U295 ( .B0(n102), .B1(n332), .A0N(row_t[5]), .A1N(n334), .Y(n395)
         );
  BUFX12 U296 ( .A(n414), .Y(lbp_addr[5]) );
  OAI211X1 U297 ( .A0(n146), .A1(n70), .B0(n73), .C0(n72), .Y(n414) );
  BUFX12 U298 ( .A(n408), .Y(lbp_addr[11]) );
  OAI221XL U299 ( .A0(n346), .A1(n64), .B0(n352), .B1(n61), .C0(n81), .Y(n408)
         );
  OR2X1 U300 ( .A(n332), .B(n391), .Y(n424) );
  INVX12 U301 ( .A(n424), .Y(lbp_data[2]) );
  BUFX12 U302 ( .A(n396), .Y(gray_addr[11]) );
  OAI2BB2XL U303 ( .B0(n352), .B1(n333), .A0N(row_t[4]), .A1N(n334), .Y(n396)
         );
  BUFX12 U304 ( .A(n415), .Y(lbp_addr[4]) );
  OAI211X1 U305 ( .A0(n346), .A1(n70), .B0(n74), .C0(n72), .Y(n415) );
  BUFX12 U306 ( .A(n409), .Y(lbp_addr[10]) );
  OAI221XL U307 ( .A0(n148), .A1(n64), .B0(n104), .B1(n61), .C0(n82), .Y(n409)
         );
  AND2X2 U308 ( .A(n333), .B(n384), .Y(n405) );
  INVX12 U309 ( .A(n405), .Y(gray_req) );
  BUFX12 U310 ( .A(n403), .Y(gray_addr[1]) );
  OAI2BB2XL U311 ( .B0(n150), .B1(n332), .A0N(col_t[1]), .A1N(n334), .Y(n403)
         );
  BUFX12 U312 ( .A(n416), .Y(lbp_addr[3]) );
  OAI211X1 U313 ( .A0(n148), .A1(n70), .B0(n75), .C0(n72), .Y(n416) );
  BUFX12 U314 ( .A(n410), .Y(lbp_addr[9]) );
  OAI221XL U315 ( .A0(n149), .A1(n64), .B0(n142), .B1(n61), .C0(n65), .Y(n410)
         );
  OR2X1 U316 ( .A(n332), .B(n392), .Y(n425) );
  INVX12 U317 ( .A(n425), .Y(lbp_data[1]) );
  OR2X1 U318 ( .A(n332), .B(n393), .Y(n426) );
  INVX12 U319 ( .A(n426), .Y(lbp_data[0]) );
  BUFX12 U320 ( .A(n398), .Y(gray_addr[6]) );
  OAI2BB2XL U321 ( .B0(n145), .B1(n333), .A0N(col_t[6]), .A1N(n334), .Y(n398)
         );
  BUFX12 U322 ( .A(n417), .Y(lbp_addr[2]) );
  OAI211X1 U323 ( .A0(n149), .A1(n70), .B0(n76), .C0(n72), .Y(n417) );
  BUFX12 U324 ( .A(n411), .Y(lbp_addr[8]) );
  OAI221XL U325 ( .A0(n150), .A1(n64), .B0(n143), .B1(n61), .C0(n68), .Y(n411)
         );
  CLKAND2X12 U326 ( .A(\sum[7] ), .B(n340), .Y(lbp_data[7]) );
  BUFX2 U327 ( .A(n338), .Y(n340) );
  OAI21X1 U328 ( .A0(n349), .A1(n352), .B0(n350), .Y(N134) );
  OAI21X1 U329 ( .A0(n343), .A1(n346), .B0(n344), .Y(N127) );
  BUFX12 U330 ( .A(n397), .Y(gray_addr[10]) );
  OAI2BB2XL U331 ( .B0(n104), .B1(n332), .A0N(row_t[3]), .A1N(n334), .Y(n397)
         );
  INVX12 U332 ( .A(n236), .Y(finish) );
  BUFX12 U333 ( .A(n418), .Y(lbp_addr[1]) );
  OAI211X1 U334 ( .A0(n150), .A1(n70), .B0(n77), .C0(n72), .Y(n418) );
  BUFX12 U335 ( .A(n412), .Y(lbp_addr[7]) );
  OAI221XL U336 ( .A0(n151), .A1(n64), .B0(N130), .B1(n61), .C0(n69), .Y(n412)
         );
  NAND2X1 U337 ( .A(n27), .B(counter[2]), .Y(n34) );
  INVX3 U338 ( .A(n336), .Y(n333) );
  INVX3 U339 ( .A(n335), .Y(n334) );
  INVX3 U340 ( .A(n328), .Y(n379) );
  CLKBUFX3 U341 ( .A(n331), .Y(n336) );
  CLKBUFX3 U342 ( .A(n335), .Y(n338) );
  INVXL U343 ( .A(N127), .Y(n320) );
  CLKBUFX3 U344 ( .A(n331), .Y(n337) );
  CLKBUFX3 U345 ( .A(n335), .Y(n339) );
  CLKBUFX3 U346 ( .A(n331), .Y(n335) );
  CLKBUFX3 U347 ( .A(n31), .Y(n328) );
  NOR2X1 U348 ( .A(n34), .B(n381), .Y(n31) );
  NAND2X2 U349 ( .A(n338), .B(n16), .Y(n61) );
  CLKBUFX3 U350 ( .A(n22), .Y(n331) );
  NOR2X2 U351 ( .A(n332), .B(n16), .Y(n66) );
  CLKINVX1 U352 ( .A(N129), .Y(n318) );
  CLKINVX1 U353 ( .A(N128), .Y(n319) );
  AOI2BB1X2 U354 ( .A0N(n78), .A1N(n340), .B0(n66), .Y(n72) );
  CLKINVX1 U355 ( .A(N126), .Y(n321) );
  CLKINVX1 U356 ( .A(N124), .Y(n323) );
  CLKINVX1 U357 ( .A(N125), .Y(n322) );
  CLKXOR2X2 U358 ( .A(n324), .B(n327), .Y(n279) );
  OAI22XL U359 ( .A0(n57), .A1(n393), .B0(n378), .B1(n33), .Y(n161) );
  CLKINVX1 U360 ( .A(n57), .Y(n378) );
  OAI31XL U361 ( .A0(counter[1]), .A1(n50), .A2(counter[0]), .B0(n334), .Y(n57) );
  OAI22XL U362 ( .A0(n376), .A1(n33), .B0(n55), .B1(n392), .Y(n160) );
  CLKINVX1 U363 ( .A(n55), .Y(n376) );
  OAI21XL U364 ( .A0(n50), .A1(n26), .B0(n333), .Y(n55) );
  OAI22XL U365 ( .A0(n382), .A1(n33), .B0(n52), .B1(n391), .Y(n159) );
  CLKINVX1 U366 ( .A(n52), .Y(n382) );
  OAI21XL U367 ( .A0(n50), .A1(n28), .B0(n333), .Y(n52) );
  OAI22XL U368 ( .A0(n380), .A1(n33), .B0(n48), .B1(n390), .Y(n158) );
  CLKINVX1 U369 ( .A(n48), .Y(n380) );
  NAND2X1 U370 ( .A(n333), .B(n23), .Y(n48) );
  OAI22XL U371 ( .A0(n375), .A1(n33), .B0(n43), .B1(n389), .Y(n157) );
  CLKINVX1 U372 ( .A(n43), .Y(n375) );
  OAI31XL U373 ( .A0(n34), .A1(counter[0]), .A2(counter[1]), .B0(n334), .Y(n43) );
  OAI22XL U374 ( .A0(n377), .A1(n33), .B0(n40), .B1(n388), .Y(n156) );
  CLKINVX1 U375 ( .A(n40), .Y(n377) );
  OAI21XL U376 ( .A0(n26), .A1(n34), .B0(n333), .Y(n40) );
  OAI22XL U377 ( .A0(n383), .A1(n33), .B0(n36), .B1(n387), .Y(n155) );
  CLKINVX1 U378 ( .A(n36), .Y(n383) );
  OAI21XL U379 ( .A0(n34), .A1(n28), .B0(n333), .Y(n36) );
  CLKINVX1 U380 ( .A(n27), .Y(n384) );
  CLKBUFX3 U381 ( .A(counter[0]), .Y(n324) );
  CLKBUFX3 U382 ( .A(counter[0]), .Y(n325) );
  CLKBUFX3 U383 ( .A(n29), .Y(n329) );
  NOR2X1 U384 ( .A(n379), .B(N349), .Y(n29) );
  OR2X1 U385 ( .A(n50), .B(n381), .Y(n23) );
  CLKINVX1 U386 ( .A(n15), .Y(n381) );
  NAND2X1 U387 ( .A(n23), .B(n24), .Y(n122) );
  OAI21XL U388 ( .A0(n381), .A1(n384), .B0(counter[2]), .Y(n24) );
  AOI21X1 U389 ( .A0(N130), .A1(n66), .B0(n67), .Y(n69) );
  AOI21X1 U390 ( .A0(N131), .A1(n66), .B0(n67), .Y(n68) );
  AOI21X1 U391 ( .A0(N132), .A1(n66), .B0(n67), .Y(n65) );
  AOI21X1 U392 ( .A0(N133), .A1(n66), .B0(n67), .Y(n82) );
  AOI21XL U393 ( .A0(N134), .A1(n66), .B0(n67), .Y(n81) );
  AOI21X1 U394 ( .A0(N135), .A1(n66), .B0(n67), .Y(n80) );
  NAND2X1 U395 ( .A(N263), .B(n27), .Y(n62) );
  NOR2X1 U396 ( .A(n63), .B(address[1]), .Y(n60) );
  NAND2X1 U397 ( .A(N124), .B(n339), .Y(n77) );
  NAND2X1 U398 ( .A(N125), .B(n339), .Y(n76) );
  NAND2X1 U399 ( .A(N126), .B(n339), .Y(n75) );
  NAND2XL U400 ( .A(N127), .B(n339), .Y(n74) );
  NAND2X1 U401 ( .A(N128), .B(n338), .Y(n73) );
  OR2X1 U402 ( .A(address[8]), .B(n330), .Y(n341) );
  OAI21XL U403 ( .A0(n143), .A1(n63), .B0(n85), .Y(n84) );
  NAND2X2 U404 ( .A(n83), .B(n92), .Y(n70) );
  NAND4X1 U405 ( .A(n148), .B(n330), .C(n346), .D(n91), .Y(n16) );
  NOR2X1 U406 ( .A(n386), .B(n141), .Y(n22) );
  AOI21X1 U407 ( .A0(N136), .A1(n66), .B0(n67), .Y(n79) );
  NAND2X1 U408 ( .A(N129), .B(n339), .Y(n71) );
  AND4X1 U409 ( .A(n101), .B(n102), .C(n352), .D(n104), .Y(n86) );
  NAND3X1 U410 ( .A(n86), .B(address[0]), .C(n142), .Y(n63) );
  NAND2X1 U411 ( .A(n90), .B(N130), .Y(n85) );
  OA21XL U412 ( .A0(n88), .A1(n89), .B0(n85), .Y(n78) );
  NAND4X1 U413 ( .A(n145), .B(n146), .C(n149), .D(n151), .Y(n89) );
  CLKBUFX3 U414 ( .A(address[7]), .Y(n330) );
  AND3X2 U415 ( .A(n86), .B(address[2]), .C(n143), .Y(n90) );
  AND3X2 U416 ( .A(n86), .B(n333), .C(n142), .Y(n83) );
  MXI4X1 U417 ( .A(n320), .B(n315), .C(n300), .D(n301), .S0(n326), .S1(n279), 
        .Y(col_t[4]) );
  CLKINVX1 U418 ( .A(N148), .Y(n315) );
  MXI2X1 U419 ( .A(N148), .B(address[11]), .S0(n324), .Y(n300) );
  MXI4X1 U420 ( .A(n319), .B(n316), .C(n302), .D(n303), .S0(n326), .S1(n279), 
        .Y(col_t[5]) );
  CLKINVX1 U421 ( .A(N149), .Y(n316) );
  MXI2X1 U422 ( .A(N149), .B(address[12]), .S0(n324), .Y(n302) );
  MXI4X1 U423 ( .A(n318), .B(n317), .C(n304), .D(n305), .S0(n326), .S1(n279), 
        .Y(col_t[6]) );
  CLKINVX1 U424 ( .A(N150), .Y(n317) );
  MXI2X1 U425 ( .A(N150), .B(address[13]), .S0(n325), .Y(n304) );
  MXI3X1 U426 ( .A(n310), .B(n286), .C(n287), .S0(n327), .S1(n326), .Y(
        row_t[4]) );
  MXI2X1 U427 ( .A(address[4]), .B(N69), .S0(n325), .Y(n286) );
  INVXL U428 ( .A(N134), .Y(n310) );
  MXI3X1 U429 ( .A(n309), .B(n288), .C(n289), .S0(n327), .S1(n326), .Y(
        row_t[5]) );
  MXI2X1 U430 ( .A(address[5]), .B(N70), .S0(n325), .Y(n288) );
  CLKINVX1 U431 ( .A(N135), .Y(n309) );
  MXI3X1 U432 ( .A(n308), .B(n290), .C(n291), .S0(n327), .S1(n326), .Y(
        row_t[6]) );
  MXI2X1 U433 ( .A(address[6]), .B(N71), .S0(n325), .Y(n290) );
  CLKINVX1 U434 ( .A(N136), .Y(n308) );
  MXI2XL U435 ( .A(address[11]), .B(N127), .S0(n324), .Y(n301) );
  MXI2X1 U436 ( .A(address[12]), .B(N128), .S0(n324), .Y(n303) );
  MXI2X1 U437 ( .A(address[13]), .B(N129), .S0(n324), .Y(n305) );
  MXI3XL U438 ( .A(N134), .B(address[4]), .C(N69), .S0(n325), .S1(n327), .Y(
        n287) );
  MXI3X1 U439 ( .A(N135), .B(address[5]), .C(N70), .S0(n324), .S1(n327), .Y(
        n289) );
  MXI3X1 U440 ( .A(N136), .B(address[6]), .C(N71), .S0(n324), .S1(n327), .Y(
        n291) );
  MXI4X1 U441 ( .A(n322), .B(n313), .C(n296), .D(n297), .S0(n326), .S1(n279), 
        .Y(col_t[2]) );
  CLKINVX1 U442 ( .A(N146), .Y(n313) );
  MXI2X1 U443 ( .A(N146), .B(address[9]), .S0(n324), .Y(n296) );
  MXI4X1 U444 ( .A(n321), .B(n314), .C(n298), .D(n299), .S0(n326), .S1(n279), 
        .Y(col_t[3]) );
  CLKINVX1 U445 ( .A(N147), .Y(n314) );
  MXI2X1 U446 ( .A(N147), .B(address[10]), .S0(n324), .Y(n298) );
  MXI3X1 U447 ( .A(n311), .B(n284), .C(n285), .S0(n327), .S1(n326), .Y(
        row_t[3]) );
  MXI2X1 U448 ( .A(address[3]), .B(N68), .S0(n325), .Y(n284) );
  CLKINVX1 U449 ( .A(N133), .Y(n311) );
  MXI2X1 U450 ( .A(address[9]), .B(N125), .S0(n324), .Y(n297) );
  AND3X2 U451 ( .A(n83), .B(address[1]), .C(N130), .Y(n67) );
  MXI2X1 U452 ( .A(address[10]), .B(N126), .S0(n324), .Y(n299) );
  MXI3X1 U453 ( .A(N133), .B(address[3]), .C(N68), .S0(n324), .S1(n327), .Y(
        n285) );
  MXI4X1 U454 ( .A(n330), .B(n330), .C(n292), .D(n293), .S0(n326), .S1(n279), 
        .Y(col_t[0]) );
  MXI2X1 U455 ( .A(N144), .B(n330), .S0(n325), .Y(n292) );
  MXI2X1 U456 ( .A(n330), .B(n151), .S0(n325), .Y(n293) );
  MXI4X1 U457 ( .A(n323), .B(n312), .C(n294), .D(n295), .S0(n326), .S1(n279), 
        .Y(col_t[1]) );
  CLKINVX1 U458 ( .A(N145), .Y(n312) );
  MXI2X1 U459 ( .A(N145), .B(address[8]), .S0(n325), .Y(n294) );
  NOR2X2 U460 ( .A(n385), .B(n140), .Y(n27) );
  MXI2X1 U461 ( .A(address[8]), .B(N124), .S0(n325), .Y(n295) );
  MXI3X1 U462 ( .A(N132), .B(address[2]), .C(N67), .S0(n324), .S1(n327), .Y(
        n283) );
  MX3XL U463 ( .A(N130), .B(n277), .C(n278), .S0(n327), .S1(n326), .Y(row_t[0]) );
  CLKMX2X2 U464 ( .A(address[0]), .B(N65), .S0(n325), .Y(n277) );
  MX3XL U465 ( .A(N130), .B(address[0]), .C(N65), .S0(n325), .S1(n327), .Y(
        n278) );
  NAND2X2 U466 ( .A(N52), .B(n27), .Y(n33) );
  CLKINVX1 U467 ( .A(gray_data[7]), .Y(n372) );
  OAI2BB2XL U468 ( .B0(n32), .B1(n33), .A0N(n32), .A1N(\sum[7] ), .Y(n154) );
  NOR2X1 U469 ( .A(n335), .B(n328), .Y(n32) );
  CLKBUFX3 U470 ( .A(counter[1]), .Y(n326) );
  CLKBUFX3 U471 ( .A(counter[2]), .Y(n327) );
  CLKINVX1 U472 ( .A(gray_data[5]), .Y(n371) );
  CLKINVX1 U473 ( .A(gray_data[3]), .Y(n370) );
  CLKINVX1 U474 ( .A(gray_data[1]), .Y(n369) );
  AOI33X1 U475 ( .A0(counter[2]), .A1(n386), .A2(n15), .B0(gray_ready), .B1(
        n141), .B2(n140), .Y(n13) );
  OAI211X1 U476 ( .A0(n10), .A1(n11), .B0(n236), .C0(n13), .Y(ns[0]) );
  NAND4BBXL U477 ( .AN(n352), .BN(n104), .C(n385), .D(n21), .Y(n10) );
  NAND4BX1 U478 ( .AN(n16), .B(address[0]), .C(address[1]), .D(address[2]), 
        .Y(n11) );
  OAI2BB2XL U479 ( .B0(n338), .B1(n113), .A0N(gray_data[7]), .A1N(n339), .Y(
        n114) );
  OAI2BB2XL U480 ( .B0(n338), .B1(n367), .A0N(gray_data[6]), .A1N(n339), .Y(
        n115) );
  OAI2BB2XL U481 ( .B0(n339), .B1(n111), .A0N(gray_data[5]), .A1N(n339), .Y(
        n116) );
  OAI2BB2XL U482 ( .B0(n339), .B1(n110), .A0N(gray_data[4]), .A1N(n339), .Y(
        n117) );
  OAI2BB2XL U483 ( .B0(n339), .B1(n109), .A0N(gray_data[3]), .A1N(n339), .Y(
        n118) );
  OAI2BB2XL U484 ( .B0(n339), .B1(n108), .A0N(gray_data[2]), .A1N(n339), .Y(
        n119) );
  OAI2BB2XL U485 ( .B0(n337), .B1(n107), .A0N(gray_data[1]), .A1N(n339), .Y(
        n120) );
  OAI2BB2XL U486 ( .B0(n336), .B1(n368), .A0N(gray_data[0]), .A1N(n339), .Y(
        n121) );
  NAND4X2 U487 ( .A(address[11]), .B(address[10]), .C(address[12]), .D(n93), 
        .Y(N349) );
  NOR4X1 U488 ( .A(n145), .B(n149), .C(n150), .D(n330), .Y(n93) );
  AO22X1 U489 ( .A0(N64), .A1(n328), .B0(address[13]), .B1(n379), .Y(n131) );
  NAND2X1 U490 ( .A(n152), .B(n27), .Y(n50) );
  AO22X1 U491 ( .A0(N58), .A1(n328), .B0(n330), .B1(n379), .Y(n137) );
  OAI2BB2XL U492 ( .B0(N130), .B1(n329), .A0N(N65), .A1N(n329), .Y(n129) );
  OAI2BB2XL U493 ( .B0(n142), .B1(n329), .A0N(N67), .A1N(n329), .Y(n127) );
  OAI2BB2XL U494 ( .B0(n102), .B1(n329), .A0N(N70), .A1N(n329), .Y(n125) );
  OAI2BB2XL U495 ( .B0(n101), .B1(n329), .A0N(N71), .A1N(n329), .Y(n124) );
  OAI2BB2XL U496 ( .B0(n143), .B1(n329), .A0N(N66), .A1N(n329), .Y(n128) );
  OAI2BB2XL U497 ( .B0(n104), .B1(n329), .A0N(N68), .A1N(n329), .Y(n130) );
  OAI2BB2XL U498 ( .B0(n352), .B1(n329), .A0N(N69), .A1N(n329), .Y(n126) );
  AO22X1 U499 ( .A0(N63), .A1(n328), .B0(address[12]), .B1(n379), .Y(n132) );
  AO22X1 U500 ( .A0(N59), .A1(n328), .B0(address[8]), .B1(n379), .Y(n136) );
  AO22X1 U501 ( .A0(N60), .A1(n328), .B0(address[9]), .B1(n379), .Y(n135) );
  AO22X1 U502 ( .A0(N61), .A1(n328), .B0(address[10]), .B1(n379), .Y(n134) );
  AO22X1 U503 ( .A0(N62), .A1(n328), .B0(address[11]), .B1(n379), .Y(n133) );
  OAI221XL U504 ( .A0(n384), .A1(n26), .B0(n105), .B1(n27), .C0(n28), .Y(n123)
         );
  NAND2X1 U505 ( .A(n105), .B(counter[0]), .Y(n26) );
  NAND2X1 U506 ( .A(n153), .B(counter[1]), .Y(n28) );
  XNOR2X1 U507 ( .A(n27), .B(n153), .Y(n139) );
  NOR2X1 U508 ( .A(n105), .B(n153), .Y(n15) );
  NOR2X1 U509 ( .A(n101), .B(n102), .Y(n21) );
  NAND2X1 U510 ( .A(n141), .B(n7), .Y(ns[1]) );
  OAI21XL U511 ( .A0(n152), .A1(n381), .B0(n386), .Y(n7) );
  AND2X1 U512 ( .A(n330), .B(N349), .Y(N397) );
  AND2X1 U513 ( .A(address[8]), .B(N349), .Y(N398) );
  AND2X1 U514 ( .A(address[9]), .B(N349), .Y(N399) );
  AND2X1 U515 ( .A(address[10]), .B(N349), .Y(N400) );
  AND2X1 U516 ( .A(address[11]), .B(N349), .Y(N401) );
  AND2X1 U517 ( .A(address[12]), .B(N349), .Y(N402) );
  OAI2BB1X1 U518 ( .A0N(n330), .A1N(address[8]), .B0(n341), .Y(N124) );
  OR2X1 U519 ( .A(n341), .B(address[9]), .Y(n342) );
  OAI2BB1X1 U520 ( .A0N(n341), .A1N(address[9]), .B0(n342), .Y(N125) );
  NOR2X1 U521 ( .A(n342), .B(address[10]), .Y(n343) );
  AO21X1 U522 ( .A0(n342), .A1(address[10]), .B0(n343), .Y(N126) );
  NAND2X1 U523 ( .A(n343), .B(n346), .Y(n344) );
  XNOR2X1 U524 ( .A(address[12]), .B(n344), .Y(N128) );
  NOR2X1 U525 ( .A(address[12]), .B(n344), .Y(n345) );
  XOR2X1 U526 ( .A(address[13]), .B(n345), .Y(N129) );
  OAI2BB1X1 U527 ( .A0N(address[0]), .A1N(address[1]), .B0(n347), .Y(N131) );
  OR2X1 U528 ( .A(n347), .B(address[2]), .Y(n348) );
  OAI2BB1X1 U529 ( .A0N(n347), .A1N(address[2]), .B0(n348), .Y(N132) );
  NOR2X1 U530 ( .A(n348), .B(address[3]), .Y(n349) );
  AO21X1 U531 ( .A0(n348), .A1(address[3]), .B0(n349), .Y(N133) );
  NAND2X1 U532 ( .A(n349), .B(n352), .Y(n350) );
  XNOR2X1 U533 ( .A(address[5]), .B(n350), .Y(N135) );
  NOR2X1 U534 ( .A(address[5]), .B(n350), .Y(n351) );
  XOR2X1 U535 ( .A(address[6]), .B(n351), .Y(N136) );
  NAND2BX1 U536 ( .AN(working_data[4]), .B(gray_data[4]), .Y(n353) );
  OAI222XL U537 ( .A0(working_data[5]), .A1(n371), .B0(working_data[5]), .B1(
        n353), .C0(n371), .C1(n353), .Y(n354) );
  OAI222XL U538 ( .A0(gray_data[6]), .A1(n354), .B0(n367), .B1(n354), .C0(
        gray_data[6]), .C1(n367), .Y(n365) );
  NOR2BX1 U539 ( .AN(working_data[4]), .B(gray_data[4]), .Y(n355) );
  OAI22XL U540 ( .A0(n355), .A1(n371), .B0(working_data[5]), .B1(n355), .Y(
        n363) );
  NAND2BX1 U541 ( .AN(working_data[2]), .B(gray_data[2]), .Y(n361) );
  OAI2BB2XL U542 ( .B0(gray_data[0]), .B1(n368), .A0N(n369), .A1N(
        working_data[1]), .Y(n356) );
  OAI21XL U543 ( .A0(working_data[1]), .A1(n369), .B0(n356), .Y(n359) );
  NOR2BX1 U544 ( .AN(working_data[2]), .B(gray_data[2]), .Y(n357) );
  OAI22XL U545 ( .A0(n357), .A1(n370), .B0(working_data[3]), .B1(n357), .Y(
        n358) );
  AOI2BB2X1 U546 ( .B0(n359), .B1(n358), .A0N(n361), .A1N(n370), .Y(n360) );
  OAI221XL U547 ( .A0(working_data[3]), .A1(n361), .B0(working_data[3]), .B1(
        n370), .C0(n360), .Y(n362) );
  OAI211X1 U548 ( .A0(gray_data[6]), .A1(n367), .B0(n363), .C0(n362), .Y(n364)
         );
  AO22X1 U549 ( .A0(n372), .A1(working_data[7]), .B0(n365), .B1(n364), .Y(n366) );
  OAI21XL U550 ( .A0(working_data[7]), .A1(n372), .B0(n366), .Y(N52) );
  AO21X1 U551 ( .A0(address[2]), .A1(address[1]), .B0(address[3]), .Y(n373) );
  NOR4X1 U552 ( .A(n373), .B(address[4]), .C(address[6]), .D(address[5]), .Y(
        N263) );
endmodule

