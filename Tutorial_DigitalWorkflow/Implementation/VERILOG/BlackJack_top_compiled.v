/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12
// Date      : Thu Apr 19 08:05:29 2018
/////////////////////////////////////////////////////////////


module BlackJack_top ( cardReady, cardValue, clk, start, lost, finished, 
        newCard, score );
  input [3:0] cardValue;
  output [4:0] score;
  input cardReady, clk, start;
  output lost, finished, newCard;
  wire   s_cardReady, s_clk, s_start, s_lost, \core/I_2/cardReadySync , n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133;
  wire   [3:0] s_cardValue;
  wire   [4:0] s_score;
  wire   [4:0] \core/I_1/regAdd ;
  wire   [4:0] \core/I_1/regLoad ;
  wire   [3:0] \core/I_2/state ;

  PADDO IO_LOST ( .A(s_lost), .PAD(lost) );
  PADDO IO_FINISHED ( .A(n67), .PAD(finished) );
  PADDO IO_NEWCARD ( .A(n68), .PAD(newCard) );
  PADDO IO_SCORE_0 ( .A(s_score[0]), .PAD(score[0]) );
  PADDO IO_SCORE_1 ( .A(s_score[1]), .PAD(score[1]) );
  PADDO IO_SCORE_2 ( .A(s_score[2]), .PAD(score[2]) );
  PADDO IO_SCORE_3 ( .A(s_score[3]), .PAD(score[3]) );
  PADDO IO_SCORE_4 ( .A(s_score[4]), .PAD(score[4]) );
  PADDI IO_CARDREADY ( .PAD(cardReady), .Y(s_cardReady) );
  PADDI IO_START ( .PAD(start), .Y(s_start) );
  PADDI IO_CARDVALUE_0 ( .PAD(cardValue[0]), .Y(s_cardValue[0]) );
  PADDI IO_CARDVALUE_1 ( .PAD(cardValue[1]), .Y(s_cardValue[1]) );
  PADDI IO_CARDVALUE_2 ( .PAD(cardValue[2]), .Y(s_cardValue[2]) );
  PADDI IO_CARDVALUE_3 ( .PAD(cardValue[3]), .Y(s_cardValue[3]) );
  PADDI IO_CLK ( .PAD(clk), .Y(s_clk) );
  DFFRHQX1 \core/I_2/cardReadySync_reg  ( .D(s_cardReady), .CK(s_clk), .RN(
        s_start), .Q(\core/I_2/cardReadySync ) );
  DFFRHQX1 \core/I_1/regAdd_reg[0]  ( .D(n62), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regAdd [0]) );
  DFFRHQX1 \core/I_1/regAdd_reg[3]  ( .D(n54), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regAdd [3]) );
  DFFRHQX1 \core/I_1/regLoad_reg[0]  ( .D(n57), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regLoad [0]) );
  DFFRHQX1 \core/I_1/regLoad_reg[3]  ( .D(n59), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regLoad [3]) );
  DFFRHQX1 \core/I_1/regLoad_reg[1]  ( .D(n61), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regLoad [1]) );
  DFFRHQX1 \core/I_1/regLoad_reg[4]  ( .D(n58), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regLoad [4]) );
  DFFRHQX1 \core/I_1/score_reg[1]  ( .D(n52), .CK(s_clk), .RN(s_start), .Q(
        s_score[1]) );
  DFFRHQX1 \core/I_1/score_reg[2]  ( .D(n51), .CK(s_clk), .RN(s_start), .Q(
        s_score[2]) );
  DFFRHQX1 \core/I_1/score_reg[3]  ( .D(n50), .CK(s_clk), .RN(s_start), .Q(
        s_score[3]) );
  DFFRHQX1 \core/I_1/score_reg[4]  ( .D(n49), .CK(s_clk), .RN(s_start), .Q(
        s_score[4]) );
  DFFRHQX1 \core/I_1/score_reg[0]  ( .D(n48), .CK(s_clk), .RN(s_start), .Q(
        s_score[0]) );
  DFFRHQX4 \core/I_2/state_reg[3]  ( .D(n66), .CK(s_clk), .RN(s_start), .Q(
        \core/I_2/state [3]) );
  DFFRHQX2 \core/I_1/regAdd_reg[4]  ( .D(n53), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regAdd [4]) );
  DFFRHQX2 \core/I_1/regAdd_reg[1]  ( .D(n56), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regAdd [1]) );
  DFFRHQX4 \core/I_2/state_reg[2]  ( .D(n63), .CK(s_clk), .RN(s_start), .Q(
        \core/I_2/state [2]) );
  DFFRHQX2 \core/I_2/state_reg[0]  ( .D(n65), .CK(s_clk), .RN(s_start), .Q(
        \core/I_2/state [0]) );
  DFFRHQX2 \core/I_1/regLoad_reg[2]  ( .D(n60), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regLoad [2]) );
  DFFRHQX2 \core/I_2/state_reg[1]  ( .D(n64), .CK(s_clk), .RN(s_start), .Q(
        \core/I_2/state [1]) );
  DFFRHQX2 \core/I_1/regAdd_reg[2]  ( .D(n55), .CK(s_clk), .RN(s_start), .Q(
        \core/I_1/regAdd [2]) );
  OAI2BB1XL U71 ( .A0N(n110), .A1N(n76), .B0(\core/I_2/state [2]), .Y(n77) );
  OAI221XL U72 ( .A0(n121), .A1(n120), .B0(n123), .B1(\core/I_1/regLoad [2]), 
        .C0(n130), .Y(n122) );
  NOR2X2 U73 ( .A(n106), .B(\core/I_2/state [2]), .Y(n92) );
  AOI32XL U74 ( .A0(n80), .A1(\core/I_2/state [3]), .A2(n96), .B0(n84), .B1(
        \core/I_2/state [3]), .Y(n71) );
  MX2XL U75 ( .A(\core/I_1/regAdd [4]), .B(s_score[4]), .S0(n133), .Y(n49) );
  MX2XL U76 ( .A(\core/I_1/regAdd [1]), .B(s_score[1]), .S0(n133), .Y(n52) );
  OAI211X2 U77 ( .A0(\core/I_2/state [3]), .A1(n80), .B0(n92), .C0(n79), .Y(
        n107) );
  NOR2X2 U78 ( .A(\core/I_1/regLoad [2]), .B(n70), .Y(n80) );
  XNOR2X1 U79 ( .A(\core/I_1/regAdd [2]), .B(n122), .Y(n55) );
  OAI222X2 U80 ( .A0(n128), .A1(n127), .B0(n128), .B1(n126), .C0(n126), .C1(
        n127), .Y(n131) );
  NOR3X2 U81 ( .A(n75), .B(n97), .C(n87), .Y(n100) );
  INVX2 U82 ( .A(\core/I_2/state [1]), .Y(n106) );
  INVX2 U83 ( .A(\core/I_2/state [0]), .Y(n96) );
  AOI211X4 U84 ( .A0(\core/I_2/state [0]), .A1(n92), .B0(n91), .C0(n115), .Y(
        n114) );
  NAND2X2 U85 ( .A(n90), .B(n94), .Y(n113) );
  OAI21X1 U86 ( .A0(n91), .A1(n81), .B0(\core/I_2/state [3]), .Y(n90) );
  NAND2X2 U87 ( .A(\core/I_2/state [2]), .B(\core/I_2/state [0]), .Y(n109) );
  XNOR2X1 U88 ( .A(\core/I_1/regAdd [1]), .B(n117), .Y(n56) );
  XNOR2X1 U89 ( .A(\core/I_1/regAdd [4]), .B(n132), .Y(n53) );
  AOI32X2 U90 ( .A0(\core/I_1/regAdd [0]), .A1(\core/I_1/regAdd [4]), .A2(
        \core/I_1/regAdd [1]), .B0(n74), .B1(\core/I_1/regAdd [4]), .Y(n76) );
  OAI211X2 U91 ( .A0(\core/I_1/regAdd [3]), .A1(\core/I_1/regAdd [1]), .B0(n74), .C0(\core/I_1/regAdd [4]), .Y(n73) );
  OAI31X2 U92 ( .A0(\core/I_1/regAdd [0]), .A1(\core/I_1/regAdd [1]), .A2(n74), 
        .B0(\core/I_1/regAdd [4]), .Y(n87) );
  OAI222X4 U93 ( .A0(\core/I_1/regAdd [2]), .A1(\core/I_1/regLoad [2]), .B0(
        \core/I_1/regAdd [2]), .B1(n123), .C0(n123), .C1(\core/I_1/regLoad [2]), .Y(n128) );
  OAI2BB1X2 U94 ( .A0N(\core/I_1/regAdd [1]), .A1N(n119), .B0(n118), .Y(n123)
         );
  NOR2X4 U95 ( .A(\core/I_2/state [0]), .B(\core/I_2/state [3]), .Y(n95) );
  AOI211X4 U96 ( .A0(\core/I_2/state [0]), .A1(\core/I_2/state [3]), .B0(n95), 
        .C0(n84), .Y(n130) );
  OAI211X2 U97 ( .A0(\core/I_2/state [3]), .A1(n106), .B0(\core/I_2/state [2]), 
        .C0(\core/I_2/state [0]), .Y(n102) );
  OAI211XL U98 ( .A0(\core/I_2/state [2]), .A1(\core/I_2/state [0]), .B0(
        \core/I_2/state [1]), .C0(\core/I_2/state [3]), .Y(n101) );
  OAI211XL U99 ( .A0(\core/I_2/state [2]), .A1(n103), .B0(n102), .C0(n101), 
        .Y(n104) );
  INVXL U100 ( .A(n73), .Y(n75) );
  AOI21XL U101 ( .A0(n106), .A1(n105), .B0(n104), .Y(n108) );
  NOR2X1 U102 ( .A(\core/I_2/state [1]), .B(n109), .Y(s_lost) );
  INVX1 U103 ( .A(\core/I_2/cardReadySync ), .Y(n98) );
  OR2X1 U104 ( .A(\core/I_1/regAdd [2]), .B(\core/I_1/regAdd [3]), .Y(n74) );
  NAND2BX1 U105 ( .AN(n76), .B(n73), .Y(n86) );
  NAND4BX1 U106 ( .AN(n109), .B(\core/I_2/state [1]), .C(n98), .D(n86), .Y(n72) );
  INVXL U107 ( .A(\core/I_1/regLoad [4]), .Y(n93) );
  NAND4X1 U108 ( .A(\core/I_1/regLoad [0]), .B(\core/I_1/regLoad [1]), .C(
        \core/I_1/regLoad [3]), .D(n93), .Y(n70) );
  INVXL U109 ( .A(n92), .Y(n84) );
  NAND2XL U110 ( .A(n72), .B(n71), .Y(n66) );
  INVX1 U111 ( .A(\core/I_2/state [2]), .Y(n97) );
  NOR2X1 U112 ( .A(n75), .B(\core/I_2/cardReadySync ), .Y(n110) );
  AOI211X1 U113 ( .A0(\core/I_2/state [0]), .A1(n77), .B0(\core/I_2/state [3]), 
        .C0(n106), .Y(n78) );
  AOI31X1 U114 ( .A0(n95), .A1(n100), .A2(n98), .B0(n78), .Y(n83) );
  NAND2XL U115 ( .A(\core/I_2/state [3]), .B(n80), .Y(n79) );
  NAND2X1 U116 ( .A(\core/I_2/state [2]), .B(n96), .Y(n85) );
  NOR2X1 U117 ( .A(\core/I_2/state [1]), .B(n85), .Y(n91) );
  NOR2XL U118 ( .A(\core/I_2/state [2]), .B(n96), .Y(n81) );
  NAND4X1 U119 ( .A(\core/I_2/state [0]), .B(\core/I_2/cardReadySync ), .C(n97), .D(n106), .Y(n82) );
  NAND4X1 U120 ( .A(n83), .B(n107), .C(n90), .D(n82), .Y(n64) );
  OR2X2 U121 ( .A(n85), .B(n106), .Y(n133) );
  INVXL U122 ( .A(n95), .Y(n103) );
  OAI222XL U123 ( .A0(n103), .A1(n87), .B0(n98), .B1(\core/I_2/state [3]), 
        .C0(n96), .C1(n86), .Y(n88) );
  NAND2XL U124 ( .A(\core/I_2/state [2]), .B(n88), .Y(n89) );
  NAND4BX1 U125 ( .AN(n130), .B(n102), .C(n133), .D(n89), .Y(n63) );
  NAND2X1 U126 ( .A(n92), .B(n95), .Y(n94) );
  INVX1 U127 ( .A(n113), .Y(n115) );
  AOI21XL U128 ( .A0(n115), .A1(n93), .B0(n114), .Y(n58) );
  NAND2BXL U129 ( .AN(s_lost), .B(n133), .Y(n67) );
  OAI31X1 U130 ( .A0(\core/I_2/state [2]), .A1(\core/I_2/state [1]), .A2(n95), 
        .B0(n94), .Y(n68) );
  NAND2XL U131 ( .A(n97), .B(n96), .Y(n99) );
  OAI32X1 U132 ( .A0(\core/I_2/cardReadySync ), .A1(\core/I_2/state [3]), .A2(
        n100), .B0(n99), .B1(n98), .Y(n105) );
  OAI211XL U133 ( .A0(n110), .A1(n109), .B0(n108), .C0(n107), .Y(n65) );
  NAND2XL U134 ( .A(\core/I_1/regLoad [0]), .B(n130), .Y(n111) );
  XNOR2X1 U135 ( .A(\core/I_1/regAdd [0]), .B(n111), .Y(n62) );
  INVXL U136 ( .A(n114), .Y(n112) );
  OA22X1 U137 ( .A0(\core/I_1/regLoad [1]), .A1(n113), .B0(s_cardValue[1]), 
        .B1(n112), .Y(n61) );
  OA22X1 U138 ( .A0(\core/I_1/regLoad [2]), .A1(n113), .B0(s_cardValue[2]), 
        .B1(n112), .Y(n60) );
  AO22XL U139 ( .A0(\core/I_1/regLoad [3]), .A1(n115), .B0(n114), .B1(
        s_cardValue[3]), .Y(n59) );
  AO22XL U140 ( .A0(\core/I_1/regLoad [0]), .A1(n115), .B0(n114), .B1(
        s_cardValue[0]), .Y(n57) );
  NAND2X1 U141 ( .A(\core/I_1/regAdd [0]), .B(\core/I_1/regLoad [0]), .Y(n116)
         );
  NAND2BX1 U142 ( .AN(n116), .B(\core/I_1/regLoad [1]), .Y(n118) );
  NAND2BX1 U143 ( .AN(\core/I_1/regLoad [1]), .B(n116), .Y(n119) );
  NAND3XL U144 ( .A(n130), .B(n118), .C(n119), .Y(n117) );
  INVXL U145 ( .A(n123), .Y(n121) );
  INVXL U146 ( .A(\core/I_1/regLoad [2]), .Y(n120) );
  INVX1 U147 ( .A(\core/I_1/regLoad [3]), .Y(n126) );
  INVXL U148 ( .A(n128), .Y(n124) );
  OAI221X1 U149 ( .A0(n128), .A1(n126), .B0(n124), .B1(\core/I_1/regLoad [3]), 
        .C0(n130), .Y(n125) );
  XNOR2X1 U150 ( .A(\core/I_1/regAdd [3]), .B(n125), .Y(n54) );
  INVXL U151 ( .A(\core/I_1/regAdd [3]), .Y(n127) );
  NAND2XL U152 ( .A(\core/I_1/regLoad [4]), .B(n131), .Y(n129) );
  OAI211XL U153 ( .A0(\core/I_1/regLoad [4]), .A1(n131), .B0(n130), .C0(n129), 
        .Y(n132) );
  MX2XL U154 ( .A(\core/I_1/regAdd [2]), .B(s_score[2]), .S0(n133), .Y(n51) );
  MX2XL U155 ( .A(\core/I_1/regAdd [3]), .B(s_score[3]), .S0(n133), .Y(n50) );
  MX2XL U156 ( .A(\core/I_1/regAdd [0]), .B(s_score[0]), .S0(n133), .Y(n48) );
endmodule

