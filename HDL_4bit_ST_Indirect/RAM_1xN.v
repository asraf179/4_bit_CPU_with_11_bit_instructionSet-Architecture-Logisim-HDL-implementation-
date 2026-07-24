module RAM_1xNbit (
    input wire clk,
    input wire reset,
    input wire [10:0] Write_Data,
    input wire Write_Select,  
    input wire Read_Select_1,  
    input wire Read_Select_2,
    output wire [10:0] Read_Data_1,
    output wire [10:0] Read_Data_2,
    output wire [10:0] RAM_row_data
);

//0 bit
RAM_1x1bit cir0thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[0]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[0]), 
    .Read_Data_2(Read_Data_2[0]),
    .RAM1bit_data(RAM_row_data[0])
);

//1 bit
RAM_1x1bit cir1stbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[1]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[1]), 
    .Read_Data_2(Read_Data_2[1]),
    .RAM1bit_data(RAM_row_data[1])
);

//2 bit
RAM_1x1bit cir2ndbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[2]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[2]), 
    .Read_Data_2(Read_Data_2[2]),
    .RAM1bit_data(RAM_row_data[2])
);

//3 bit
RAM_1x1bit cir3rdbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[3]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[3]), 
    .Read_Data_2(Read_Data_2[3]),
    .RAM1bit_data(RAM_row_data[3])
);

//4 bit
RAM_1x1bit cir4thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[4]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[4]), 
    .Read_Data_2(Read_Data_2[4]),
    .RAM1bit_data(RAM_row_data[4])
);

//5 bit
RAM_1x1bit cir5thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[5]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[5]), 
    .Read_Data_2(Read_Data_2[5]),
    .RAM1bit_data(RAM_row_data[5])
);

//6 bit
RAM_1x1bit cir6thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[6]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[6]), 
    .Read_Data_2(Read_Data_2[6]),
    .RAM1bit_data(RAM_row_data[6])
);

//7 bit
RAM_1x1bit cir7thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[7]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[7]), 
    .Read_Data_2(Read_Data_2[7]),
    .RAM1bit_data(RAM_row_data[7])
);

//8 bit
RAM_1x1bit cir8thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[8]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[8]), 
    .Read_Data_2(Read_Data_2[8]),
    .RAM1bit_data(RAM_row_data[8])
);

//9 bit
RAM_1x1bit cir9thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[9]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[9]), 
    .Read_Data_2(Read_Data_2[9]),
    .RAM1bit_data(RAM_row_data[9])
);

//10 bit
RAM_1x1bit cir10thbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[10]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[10]), 
    .Read_Data_2(Read_Data_2[10]),
    .RAM1bit_data(RAM_row_data[10])
);

endmodule
