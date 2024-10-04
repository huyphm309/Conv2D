
`define IMAGESIZE	32
`define IMAGEWIDTH	32
`define WEIGHTSIZE	149
`define CONVOLSIZE	28
`define TOTAL_PIXEL_COUNT 784
module TopDesign(
    input clk,
	input rst,
	output finalOutput
);
    reg [31:0] imageArray [0:1023];	
    								
	reg [31:0] weightArray [0:149];			
	initial $readmemb("C:/CEUIT/IT002/BTQT/CNN2/KernelArray/input_1d.txt", imageArray, 0, 1023);
	initial $readmemb("C:/CEUIT/IT002/BTQT/CNN2/KernelArray/kernel0_1d.txt", weightArray, 0, 149);
	//Conv2D declea
	wire [31:0] finalOutput;
    wire [31:0] input0, input1, input2, input3, input4, input5, input6, input7, input8, input9,
    input10, input11, input12, input13, input14, input15, input16, input17, input18, input19,
    input20, input21, input22, input23, input24;
    
    wire [31:0]     weight0, weight1, weight2, weight3, weight4, weight5, weight6, weight7, weight8, weight9,
                    weight10, weight11, weight12, weight13, weight14, weight15, weight16, weight17, weight18, weight19,
                    weight20, weight21, weight22, weight23, weight24;
	wire done;
	reg enable;
	
	reg [14:0] count_stage1_image;
	reg [14:0] writeCount_stage1_image = 0;
	reg [6:0] rowCount_image;
	reg load;
	reg convDone;
	reg [2:0] kernelCount; 

Conv2D c1 (
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
    
 // Gán tr?ng s? cho kernel hi?n t?i (kernelCount t? 0 ??n 5 ?? l?y 6 kernel t? weightArray)
assign weight0 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 0] : 32'b0; 
assign weight1 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 1] : 32'b0; 
assign weight2 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 2] : 32'b0; 
assign weight3 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 3] : 32'b0; 
assign weight4 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 4] : 32'b0; 
assign weight5 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 5] : 32'b0; 
assign weight6 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 6] : 32'b0; 
assign weight7 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 7] : 32'b0; 
assign weight8 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 8] : 32'b0; 
assign weight9 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 9] : 32'b0; 
assign weight10 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 10] : 32'b0; 
assign weight11 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 11] : 32'b0; 
assign weight12 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 12] : 32'b0; 
assign weight13 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 13] : 32'b0; 
assign weight14 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 14] : 32'b0; 
assign weight15 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 15] : 32'b0; 
assign weight16 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 16] : 32'b0; 
assign weight17 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 17] : 32'b0; 
assign weight18 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 18] : 32'b0; 
assign weight19 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 19] : 32'b0; 
assign weight20 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 20] : 32'b0; 
assign weight21 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 21] : 32'b0; 
assign weight22 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 22] : 32'b0; 
assign weight23 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 23] : 32'b0; 
assign weight24 = (kernelCount < 6) ? weightArray[kernelCount * 25 + 24] : 32'b0; 

    
    
    assign input0 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 0][3:0] : 4'b0000;	
    assign input1 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 1][3:0] : 4'b0000;	
	assign input2 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 2][3:0] : 4'b0000;
	assign input3 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 3][3:0] : 4'b0000;
	assign input4 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 4][3:0] : 4'b0000;
	
    assign input5 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 32][3:0] : 4'b0000;	
    assign input6 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 33][3:0] : 4'b0000;	
	assign input7 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 34][3:0] : 4'b0000;
	assign input8 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 35][3:0] : 4'b0000;
	assign input9 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 36][3:0] : 4'b0000;
	
	assign input10 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 64][3:0] : 4'b0000;
    assign input11 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 65][3:0] : 4'b0000;	
	assign input12 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 66][3:0] : 4'b0000;
	assign input13 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 67][3:0] : 4'b0000;
	assign input14 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 68][3:0] : 4'b0000;
	
    assign input15 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 96][3:0] : 4'b0000;	
    assign input16 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 97][3:0] : 4'b0000;	
	assign input17 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 98][3:0] : 4'b0000;
	assign input18 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 99][3:0] : 4'b0000;
	assign input19 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 100][3:0] : 4'b0000;
	
    assign input20 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 128][3:0] : 4'b0000;	
    assign input21 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 129][3:0] : 4'b0000;	
	assign input22 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 130][3:0] : 4'b0000;
	assign input23 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 131][3:0] : 4'b0000;
	assign input24 = (enable && (rowCount_image < `IMAGESIZE - 1)) ? imageArray[count_stage1_image  + 132][3:0] : 4'b0000;




always @ (posedge clk) begin
    if (rst) begin
        enable <= 1'b0;
        count_stage1_image <= 0;
        rowCount_image <= 7'b0000001;
        load <= 1'b0;
        kernelCount <= 3'b000; // Kh?i t?o kernelCount v? 0
        convDone <= 1'b0;      // ??t convDone v? 0
        writeCount_stage1_image <= 0; // Kh?i t?o writeCount_stage1_image
    end
    else begin
        enable <= 1'b1;
        load <= 1'b1;

        if (enable) begin
            if (count_stage1_image < `IMAGESIZE*`CONVOLSIZE) begin
                count_stage1_image <= count_stage1_image + 1'b1;
                if (count_stage1_image % `IMAGESIZE == 0) begin
                    rowCount_image <= rowCount_image + 1'b1; 
                end
            end
            else begin
                if (kernelCount < 5) begin
                    kernelCount <= kernelCount + 1'b1; 
                end
                else begin
                    kernelCount <= 3'b000; 
                    convDone <= 1'b1; 
                end
                count_stage1_image <= 0;
                rowCount_image <= 7'b0000001; 
                enable <= 1'b1; 
            end
        end
    end
end





/*
KernelMemory km (
        .clk(clk),
        .rst(rst),
        .load(load),
        .kernelCount(kernelCount),
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
        .done(don)
    );*/





endmodule
