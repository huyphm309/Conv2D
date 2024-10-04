/*module Conv2D #( 
parameter DATA_WIDTH = 16,   // T?ng chi?u r?ng d? li?u
parameter FIXED_POINT = 7    // S? bit cho ph?n phân s?
)(		
    input clk,	
    input signed [DATA_WIDTH - 1:0] input0,		
    input signed [DATA_WIDTH - 1:0] input1,		
    input signed [DATA_WIDTH - 1:0] input2,		
    input signed [DATA_WIDTH - 1:0] input3,		
    input signed [DATA_WIDTH - 1:0] input4,		
    input signed [DATA_WIDTH - 1:0] input5,		
    input signed [DATA_WIDTH - 1:0] input6,		
    input signed [DATA_WIDTH - 1:0] input7,		
    input signed [DATA_WIDTH - 1:0] input8,		
    input signed [DATA_WIDTH - 1:0] input9,		
    input signed [DATA_WIDTH - 1:0] input10,		
    input signed [DATA_WIDTH - 1:0] input11,		
    input signed [DATA_WIDTH - 1:0] input12,		
    input signed [DATA_WIDTH - 1:0] input13,		
    input signed [DATA_WIDTH - 1:0] input14,		
    input signed [DATA_WIDTH - 1:0] input15,		
    input signed [DATA_WIDTH - 1:0] input16,		
    input signed [DATA_WIDTH - 1:0] input17,		
    input signed [DATA_WIDTH - 1:0] input18,		
    input signed [DATA_WIDTH - 1:0] input19,		
    input signed [DATA_WIDTH - 1:0] input20,		
    input signed [DATA_WIDTH - 1:0] input21,		
    input signed [DATA_WIDTH - 1:0] input22,		
    input signed [DATA_WIDTH - 1:0] input23,		
    input signed [DATA_WIDTH - 1:0] input24,		

    input signed [DATA_WIDTH - 1:0] weight0,		
    input signed [DATA_WIDTH - 1:0] weight1,		
    input signed [DATA_WIDTH - 1:0] weight2,		
    input signed [DATA_WIDTH - 1:0] weight3,		
    input signed [DATA_WIDTH - 1:0] weight4,		
    input signed [DATA_WIDTH - 1:0] weight5,		
    input signed [DATA_WIDTH - 1:0] weight6,		
    input signed [DATA_WIDTH - 1:0] weight7,		
    input signed [DATA_WIDTH - 1:0] weight8,		
    input signed [DATA_WIDTH - 1:0] weight9,		
    input signed [DATA_WIDTH - 1:0] weight10,		
    input signed [DATA_WIDTH - 1:0] weight11,		
    input signed [DATA_WIDTH - 1:0] weight12,		
    input signed [DATA_WIDTH - 1:0] weight13,		
    input signed [DATA_WIDTH - 1:0] weight14,		
    input signed [DATA_WIDTH - 1:0] weight15,		
    input signed [DATA_WIDTH - 1:0] weight16,		
    input signed [DATA_WIDTH - 1:0] weight17,		
    input signed [DATA_WIDTH - 1:0] weight18,		
    input signed [DATA_WIDTH - 1:0] weight19,		
    input signed [DATA_WIDTH - 1:0] weight20,		
    input signed [DATA_WIDTH - 1:0] weight21,		
    input signed [DATA_WIDTH - 1:0] weight22,		
    input signed [DATA_WIDTH - 1:0] weight23,
    input signed [DATA_WIDTH - 1:0] weight24,	

    output reg signed [31:0] finalOutput, // K?t qu? cu?i cùng, s? d?ng signed ?? x? lý âm
	input enable,	
	output reg done
	);

	reg signed [31:0] tempOutput[0:24];	

	always @ (posedge clk) begin	
		if(enable) begin
            // Nhân các ??u vào v?i tr?ng s?
            tempOutput[0] <= (input0 * weight0) >>> FIXED_POINT; // D?ch ph?i FIXED_POINT bit ?? ?i?u ch?nh k?t qu?
            tempOutput[1] <= (input1 * weight1) >>> FIXED_POINT;
            tempOutput[2] <= (input2 * weight2) >>> FIXED_POINT;
            tempOutput[3] <= (input3 * weight3) >>> FIXED_POINT;
            tempOutput[4] <= (input4 * weight4) >>> FIXED_POINT;
            tempOutput[5] <= (input5 * weight5) >>> FIXED_POINT;
            tempOutput[6] <= (input6 * weight6) >>> FIXED_POINT;
            tempOutput[7] <= (input7 * weight7) >>> FIXED_POINT;
            tempOutput[8] <= (input8 * weight8) >>> FIXED_POINT;
            tempOutput[9] <= (input9 * weight9) >>> FIXED_POINT;
            tempOutput[10] <= (input10 * weight10) >>> FIXED_POINT;
            tempOutput[11] <= (input11 * weight11) >>> FIXED_POINT;
            tempOutput[12] <= (input12 * weight12) >>> FIXED_POINT;
            tempOutput[13] <= (input13 * weight13) >>> FIXED_POINT;
            tempOutput[14] <= (input14 * weight14) >>> FIXED_POINT;
            tempOutput[15] <= (input15 * weight15) >>> FIXED_POINT;
            tempOutput[16] <= (input16 * weight16) >>> FIXED_POINT;
            tempOutput[17] <= (input17 * weight17) >>> FIXED_POINT;
            tempOutput[18] <= (input18 * weight18) >>> FIXED_POINT;
            tempOutput[19] <= (input19 * weight19) >>> FIXED_POINT;
            tempOutput[20] <= (input20 * weight20) >>> FIXED_POINT;
            tempOutput[21] <= (input21 * weight21) >>> FIXED_POINT;
            tempOutput[22] <= (input22 * weight22) >>> FIXED_POINT;
            tempOutput[23] <= (input23 * weight23) >>> FIXED_POINT;
            tempOutput[24] <= (input24 * weight24) >>> FIXED_POINT;

            done <= 1'b1;
		end
	end	

    // C?ng t?t c? giá tr? trong tempOutput
	always @(*) begin		
        finalOutput = tempOutput[0] + tempOutput[1] + tempOutput[2] + tempOutput[3] + 
                      tempOutput[4] + tempOutput[5] + tempOutput[6] + tempOutput[7] + 
                      tempOutput[8] + tempOutput[9] + tempOutput[10] + tempOutput[11] + 
                      tempOutput[12] + tempOutput[13] + tempOutput[14] + tempOutput[15] + 
                      tempOutput[16] + tempOutput[17] + tempOutput[18] + tempOutput[19] + 
                      tempOutput[20] + tempOutput[21] + tempOutput[22] + tempOutput[23] + 
                      tempOutput[24];

        // D?ch ph?i ?? ??m b?o r?ng k?t qu? là ?úng v?i s? bit c?n thi?t
        finalOutput = finalOutput >>> FIXED_POINT; // D?ch ph?i FIXED_POINT bit
    end		
endmodule*/
module Conv2D (		
	input clk,	
    input [31:0] input0,		
    input [31:0] input1,		
    input [31:0] input2,		
    input [31:0] input3,		
    input [31:0] input4,		
    input [31:0] input5,		
    input [31:0] input6,		
    input [31:0] input7,		
    input [31:0] input8,		
    input [31:0] input9,		
    input [31:0] input10,		
    input [31:0] input11,		
    input [31:0] input12,		
    input [31:0] input13,		
    input [31:0] input14,		
    input [31:0] input15,		
    input [31:0] input16,		
    input [31:0] input17,		
    input [31:0] input18,		
    input [31:0] input19,		
    input [31:0] input20,		
    input [31:0] input21,		
    input [31:0] input22,		
    input [31:0] input23,		
    input [31:0] input24,		
    
    input [31:0] weight0,
    input [31:0] weight1,
    input [31:0] weight2,
    input [31:0] weight3,
    input [31:0] weight4,
    input [31:0] weight5,
    input [31:0] weight6,
    input [31:0] weight7,
    input [31:0] weight8,
    input [31:0] weight9,
    input [31:0] weight10,
    input [31:0] weight11,
    input [31:0] weight12,
    input [31:0] weight13,
    input [31:0] weight14,
    input [31:0] weight15,
    input [31:0] weight16,
    input [31:0] weight17,
    input [31:0] weight18,
    input [31:0] weight19,
    input [31:0] weight20,
    input [31:0] weight21,
    input [31:0] weight22,
    input [31:0] weight23,
    input [31:0] weight24,
    
    
    output reg [31:0] finalOutput,		

	input enable,	
	output reg done	
    );		
	reg [31:0] tempOutput[0:24];	
		
		
		
	always @ (posedge clk) begin	
		if(enable) begin
        tempOutput[0]<= input0 * weight0 ;		
        tempOutput[1]<= input1 * weight1 ;		
        tempOutput[2]<= input2 * weight2 ;		
        tempOutput[3]<= input3 * weight3 ;		
        tempOutput[4]<= input4 * weight4 ;		
        tempOutput[5]<= input5 * weight5 ;		
        tempOutput[6]<= input6 * weight6 ;		
        tempOutput[7]<= input7 * weight7 ;		
        tempOutput[8]<= input8 * weight8 ;		
        tempOutput[9]<= input9 * weight9 ;		
        tempOutput[10]<= input10* weight10 ;		
        tempOutput[11]<= input11* weight11 ;		
        tempOutput[12]<= input12* weight12 ;		
        tempOutput[13]<= input13* weight13 ;		
        tempOutput[14]<= input14* weight14 ;		
        tempOutput[15]<= input15* weight15 ;		
        tempOutput[16]<= input16* weight16 ;		
        tempOutput[17]<= input17* weight17 ;		
        tempOutput[18]<= input18* weight18 ;		
        tempOutput[19]<= input19* weight19 ;		
        tempOutput[20]<= input20* weight20 ;		
        tempOutput[21]<= input21* weight21 ;		
        tempOutput[22]<= input22* weight22 ;		
        tempOutput[23]<= input23* weight23 ;		
        tempOutput[24]<= input24* weight24 ;  		
 		
          		
		done <= 1'b0;
		end
	end	
		
always @(*) begin		
        finalOutput <= tempOutput[0] + tempOutput[1] + tempOutput[2] + tempOutput[3] + tempOutput[4] + 	
                        tempOutput[5] + tempOutput[6] + tempOutput[7] + tempOutput[8] + tempOutput[9] + 	
                        tempOutput[10] + tempOutput[11] + tempOutput[12] + tempOutput[13] + tempOutput[14] + 	
                        tempOutput[15] + tempOutput[16] + tempOutput[17] + tempOutput[18] + tempOutput[19] + 	
                        tempOutput[20] + tempOutput[21] + tempOutput[22] + tempOutput[23] + tempOutput[24];	
	
    end		
		
endmodule