`timescale 1ns / 1ps

module tb_Conv2D;

    // Tham s?
    parameter DATA_WIDTH = 16;
    parameter FIXED_POINT = 7;

    // Các tín hi?u ??u vào
    reg clk;
    reg signed [DATA_WIDTH - 1:0] input0, input1, input2, input3, input4;
    reg signed [DATA_WIDTH - 1:0] input5, input6, input7, input8, input9;
    reg signed [DATA_WIDTH - 1:0] input10, input11, input12, input13, input14;
    reg signed [DATA_WIDTH - 1:0] input15, input16, input17, input18, input19;
    reg signed [DATA_WIDTH - 1:0] input20, input21, input22, input23, input24;
    reg signed [DATA_WIDTH - 1:0] weight0, weight1, weight2, weight3, weight4;
    reg signed [DATA_WIDTH - 1:0] weight5, weight6, weight7, weight8, weight9;
    reg signed [DATA_WIDTH - 1:0] weight10, weight11, weight12, weight13, weight14;
    reg signed [DATA_WIDTH - 1:0] weight15, weight16, weight17, weight18, weight19;
    reg signed [DATA_WIDTH - 1:0] weight20, weight21, weight22, weight23, weight24;

    // Các tín hi?u ??u ra
    wire signed [31:0] finalOutput;
    reg enable;
    wire done;

    // Kh?i t?o mô-?un Conv2D
    Conv2D #(DATA_WIDTH, FIXED_POINT) uut (
        .clk(clk),
        .input0(input0),
        .input1(input1),
        .input2(input2),
        .input3(input3),
        .input4(input4),
        .input5(input5),
        .input6(input6),
        .input7(input7),
        .input8(input8),
        .input9(input9),
        .input10(input10),
        .input11(input11),
        .input12(input12),
        .input13(input13),
        .input14(input14),
        .input15(input15),
        .input16(input16),
        .input17(input17),
        .input18(input18),
        .input19(input19),
        .input20(input20),
        .input21(input21),
        .input22(input22),
        .input23(input23),
        .input24(input24),
        .weight0(weight0),
        .weight1(weight1),
        .weight2(weight2),
        .weight3(weight3),
        .weight4(weight4),
        .weight5(weight5),
        .weight6(weight6),
        .weight7(weight7),
        .weight8(weight8),
        .weight9(weight9),
        .weight10(weight10),
        .weight11(weight11),
        .weight12(weight12),
        .weight13(weight13),
        .weight14(weight14),
        .weight15(weight15),
        .weight16(weight16),
        .weight17(weight17),
        .weight18(weight18),
        .weight19(weight19),
        .weight20(weight20),
        .weight21(weight21),
        .weight22(weight22),
        .weight23(weight23),
        .weight24(weight24),
        .finalOutput(finalOutput),
        .enable(enable),
        .done(done)
    );

    // Kh?i t?o xung ??ng h?
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // T?o xung ??ng h? v?i chu k? 10ns
    end

    // Ki?m tra ch?c n?ng
    initial begin
        // Kh?i t?o các tín hi?u
        enable = 0;

        // Thi?t l?p các giá tr? ??u vào
        input0 = 16'sd1;   weight0 = 16'sd1; 
        input1 = 16'sd2;   weight1 = 16'sd2; 
        input2 = 16'sd3;   weight2 = 16'sd3; 
        input3 = 16'sd4;   weight3 = 16'sd4; 
        input4 = 16'sd5;   weight4 = 16'sd5; 
        input5 = 16'sd6;   weight5 = 16'sd6; 
        input6 = 16'sd7;   weight6 = 16'sd7; 
        input7 = 16'sd8;   weight7 = 16'sd8; 
        input8 = 16'sd9;   weight8 = 16'sd9; 
        input9 = 16'sd10;  weight9 = 16'sd10; 
        input10 = 16'sd11; weight10 = 16'sd11; 
        input11 = 16'sd12; weight11 = 16'sd12; 
        input12 = 16'sd13; weight12 = 16'sd13; 
        input13 = 16'sd14; weight13 = 16'sd14; 
        input14 = 16'sd15; weight14 = 16'sd15; 
        input15 = 16'sd16; weight15 = 16'sd16; 
        input16 = 16'sd17; weight16 = 16'sd17; 
        input17 = 16'sd18; weight17 = 16'sd18; 
        input18 = 16'sd19; weight18 = 16'sd19; 
        input19 = 16'sd20; weight19 = 16'sd20; 
        input20 = 16'sd21; weight20 = 16'sd21; 
        input21 = 16'sd22; weight21 = 16'sd22; 
        input22 = 16'sd23; weight22 = 16'sd23; 
        input23 = 16'sd24; weight23 = 16'sd24; 
        input24 = 16'sd25; weight24 = 16'sd25; 

        // Kích ho?t mô-?un
        #10 enable = 1; 
        #10 enable = 0;

        // ??i mô-?un hoàn thành
        wait(done);
        #10;

        // Ki?m tra k?t qu?
        $display("Final Output: %d", finalOutput);
        $stop;
    end

endmodule
