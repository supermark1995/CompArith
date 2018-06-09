
module acc ( enable, data_in, data_out, reset, clk );
  input [31:0] data_in;
  output [31:0] data_out;
  input enable, reset, clk;
  wire   N0, N1, N2, R_enable, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55,
         N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83,
         N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97,
         N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109,
         N110, N111, N112, N113, N114, N115, N116, N117, N118, N119, N120,
         N121, N122, N123, N124, N125, N126, N127, N128, N129, N130, N131,
         N132, N133, N134, N135, N136, N137, N138, net11;
  wire   [31:0] R_data;

  \**SEQGEN**  \R_data_reg[31]  ( .clear(1'b0), .preset(1'b0), .next_state(N36), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[31]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[30]  ( .clear(1'b0), .preset(1'b0), .next_state(N35), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[30]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[29]  ( .clear(1'b0), .preset(1'b0), .next_state(N34), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[29]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[28]  ( .clear(1'b0), .preset(1'b0), .next_state(N33), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[28]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[27]  ( .clear(1'b0), .preset(1'b0), .next_state(N32), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[27]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[26]  ( .clear(1'b0), .preset(1'b0), .next_state(N31), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[26]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[25]  ( .clear(1'b0), .preset(1'b0), .next_state(N30), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[25]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[24]  ( .clear(1'b0), .preset(1'b0), .next_state(N29), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[24]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[23]  ( .clear(1'b0), .preset(1'b0), .next_state(N28), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[23]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[22]  ( .clear(1'b0), .preset(1'b0), .next_state(N27), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[22]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[21]  ( .clear(1'b0), .preset(1'b0), .next_state(N26), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[21]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[20]  ( .clear(1'b0), .preset(1'b0), .next_state(N25), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[20]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[19]  ( .clear(1'b0), .preset(1'b0), .next_state(N24), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[19]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[18]  ( .clear(1'b0), .preset(1'b0), .next_state(N23), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[18]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[17]  ( .clear(1'b0), .preset(1'b0), .next_state(N22), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[17]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[16]  ( .clear(1'b0), .preset(1'b0), .next_state(N21), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[16]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[15]  ( .clear(1'b0), .preset(1'b0), .next_state(N20), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[14]  ( .clear(1'b0), .preset(1'b0), .next_state(N19), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[13]  ( .clear(1'b0), .preset(1'b0), .next_state(N18), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[12]  ( .clear(1'b0), .preset(1'b0), .next_state(N17), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[11]  ( .clear(1'b0), .preset(1'b0), .next_state(N16), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[10]  ( .clear(1'b0), .preset(1'b0), .next_state(N15), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[9]  ( .clear(1'b0), .preset(1'b0), .next_state(N14), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[8]  ( .clear(1'b0), .preset(1'b0), .next_state(N13), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(N12), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(N11), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(N10), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N9), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N8), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N7), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N6), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \R_data_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N5), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_data[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  R_enable_reg ( .clear(1'b0), .preset(1'b0), .next_state(N3), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(R_enable), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_reg[31]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N136), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[31]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[30]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N135), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[30]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[29]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N134), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[29]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[28]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N133), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[28]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[27]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N132), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[27]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[26]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N131), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[26]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[25]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N130), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[25]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[24]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N129), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[24]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[23]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N128), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[23]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[22]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N127), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[22]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[21]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N126), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[21]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[20]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N125), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[20]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[19]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N124), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[19]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[18]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N123), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[18]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[17]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N122), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[17]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[16]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N121), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[16]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[15]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N120), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[14]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N119), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[13]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N118), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[12]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N117), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[11]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N116), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[10]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N115), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        data_out[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N37) );
  \**SEQGEN**  \data_out_reg[9]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N114), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N113), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N112), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N111), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N110), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N109), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N108), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N107), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N106), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  \**SEQGEN**  \data_out_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N105), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(data_out[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        N37) );
  ADD_UNS_OP add_24 ( .A(data_out), .B(R_data), .Z({N71, N70, N69, N68, N67, 
        N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, 
        N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39})
         );
  SELECT_OP C260 ( .DATA1(1'b0), .DATA2(enable), .CONTROL1(N0), .CONTROL2(N1), 
        .Z(N3) );
  GTECH_BUF B_0 ( .A(reset), .Z(N0) );
  GTECH_BUF B_1 ( .A(N4), .Z(N1) );
  SELECT_OP C261 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(data_in), .CONTROL1(N0), .CONTROL2(N1), .Z({N36, N35, N34, N33, N32, 
        N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, 
        N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5}) );
  SELECT_OP C262 ( .DATA1({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .DATA2({N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, 
        N43, N42, N41, N40, N39}), .CONTROL1(N2), .CONTROL2(N72), .Z({N104, 
        N103, N102, N101, N100, N99, N98, N97, N96, N95, N94, N93, N92, N91, 
        N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N79, N78, N77, 
        N76, N75, N74, N73}) );
  GTECH_BUF B_2 ( .A(N71), .Z(N2) );
  SELECT_OP C263 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N104, N103, N102, N101, N100, N99, N98, N97, N96, N95, N94, N93, 
        N92, N91, N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N79, 
        N78, N77, N76, N75, N74, N73}), .CONTROL1(N0), .CONTROL2(N138), .Z({
        N136, N135, N134, N133, N132, N131, N130, N129, N128, N127, N126, N125, 
        N124, N123, N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, 
        N112, N111, N110, N109, N108, N107, N106, N105}) );
  GTECH_NOT I_0 ( .A(reset), .Z(N4) );
  GTECH_OR2 C270 ( .A(R_enable), .B(reset), .Z(N37) );
  GTECH_BUF B_3 ( .A(N138), .Z(N38) );
  GTECH_NOT I_1 ( .A(N71), .Z(N72) );
  GTECH_NOT I_2 ( .A(reset), .Z(N137) );
  GTECH_AND2 C276 ( .A(R_enable), .B(N137), .Z(N138) );
  GTECH_AND2 C277 ( .A(N38), .B(N137), .Z(net11) );
endmodule

