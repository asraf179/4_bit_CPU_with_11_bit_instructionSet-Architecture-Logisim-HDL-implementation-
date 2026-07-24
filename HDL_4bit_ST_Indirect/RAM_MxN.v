module RAM_MxNbit (
    input wire clk,
    input wire reset,
    input wire [10:0] Write_Data,
    input wire [2:0] Write_Address,
    input wire Write_Enable,  
    input wire [2:0] Read_Address_1,
    input wire [2:0] Read_Address_2,
    output wire [10:0] Read_Data_1,
    output wire [10:0] Read_Data_2,
    output wire [10:0] RAMrow0,
    output wire [10:0] RAMrow1,
    output wire [10:0] RAMrow2,
    output wire [10:0] RAMrow3,
    output wire [10:0] RAMrow4,
    output wire [10:0] RAMrow5,
    output wire [10:0] RAMrow6,
    output wire [10:0] RAMrow7
);

    wire [10:0] RD1_row0, RD1_row1, RD1_row2, RD1_row3, RD1_row4, RD1_row5, RD1_row6, RD1_row7;
    wire [10:0] RD2_row0, RD2_row1, RD2_row2, RD2_row3, RD2_row4, RD2_row5, RD2_row6, RD2_row7;
    wire [10:0] RAM_row0, RAM_row1, RAM_row2, RAM_row3, RAM_row4, RAM_row5, RAM_row6, RAM_row7;
    reg [7:0] WR_SEL, RD1_SEL, RD2_SEL;
    // 00000010, 00000010, 00000001

    RAM_1xNbit ram_row0
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[0]), 
        .Read_Select_1(RD1_SEL[0]), 
        .Read_Select_2(RD2_SEL[0]), 
        .Read_Data_1(RD1_row0), 
        .Read_Data_2(RD2_row0),
        .RAM_row_data(RAM_row0)
    );

    RAM_1xNbit ram_row1 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[1]), 
        .Read_Select_1(RD1_SEL[1]), 
        .Read_Select_2(RD2_SEL[1]), 
        .Read_Data_1(RD1_row1), 
        .Read_Data_2(RD2_row1),
        .RAM_row_data(RAM_row1)
    );

    RAM_1xNbit ram_row2 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[2]), 
        .Read_Select_1(RD1_SEL[2]), 
        .Read_Select_2(RD2_SEL[2]), 
        .Read_Data_1(RD1_row2), 
        .Read_Data_2(RD2_row2),
        .RAM_row_data(RAM_row2)
    );

    RAM_1xNbit ram_row3 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[3]), 
        .Read_Select_1(RD1_SEL[3]), 
        .Read_Select_2(RD2_SEL[3]), 
        .Read_Data_1(RD1_row3), 
        .Read_Data_2(RD2_row3),
        .RAM_row_data(RAM_row3)
    );

    RAM_1xNbit ram_row4 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[4]), 
        .Read_Select_1(RD1_SEL[4]), 
        .Read_Select_2(RD2_SEL[4]), 
        .Read_Data_1(RD1_row4), 
        .Read_Data_2(RD2_row4),
        .RAM_row_data(RAM_row4)
    );

    RAM_1xNbit ram_row5 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[5]), 
        .Read_Select_1(RD1_SEL[5]), 
        .Read_Select_2(RD2_SEL[5]), 
        .Read_Data_1(RD1_row5), 
        .Read_Data_2(RD2_row5),
        .RAM_row_data(RAM_row5)
    );

    RAM_1xNbit ram_row6 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[6]), 
        .Read_Select_1(RD1_SEL[6]), 
        .Read_Select_2(RD2_SEL[6]), 
        .Read_Data_1(RD1_row6), 
        .Read_Data_2(RD2_row6),
        .RAM_row_data(RAM_row6)
    );

    RAM_1xNbit ram_row7 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[7]), 
        .Read_Select_1(RD1_SEL[7]), 
        .Read_Select_2(RD2_SEL[7]), 
        .Read_Data_1(RD1_row7), 
        .Read_Data_2(RD2_row7),
        .RAM_row_data(RAM_row7)
    );


    always @(*) 
       begin
            case ({Write_Enable, Write_Address})
                4'b1000: WR_SEL = 8'b0000_0001;
                4'b1001: WR_SEL = 8'b0000_0010;
                4'b1010: WR_SEL = 8'b0000_0100;
                4'b1011: WR_SEL = 8'b0000_1000;
                4'b1100: WR_SEL = 8'b0001_0000;
                4'b1101: WR_SEL = 8'b0010_0000;
                4'b1110: WR_SEL = 8'b0100_0000;
                4'b1111: WR_SEL = 8'b1000_0000;
                default: WR_SEL = 8'b0000_0000;
            endcase
        end 

    always @(*) 
        begin
            case (Read_Address_1)
                3'b000: RD1_SEL = 8'b0000_0001;
                3'b001: RD1_SEL = 8'b0000_0010;
                3'b010: RD1_SEL = 8'b0000_0100;
                3'b011: RD1_SEL = 8'b0000_1000;
                3'b100: RD1_SEL = 8'b0001_0000;
                3'b101: RD1_SEL = 8'b0010_0000;
                3'b110: RD1_SEL = 8'b0100_0000;
                3'b111: RD1_SEL = 8'b1000_0000;
                default: RD1_SEL = 8'b0000_0000;
            endcase
        end

    always @(*) 
        begin
            case (Read_Address_2)
                3'b000: RD2_SEL = 8'b0000_0001;
                3'b001: RD2_SEL = 8'b0000_0010;
                3'b010: RD2_SEL = 8'b0000_0100;
                3'b011: RD2_SEL = 8'b0000_1000;
                3'b100: RD2_SEL = 8'b0001_0000;
                3'b101: RD2_SEL = 8'b0010_0000;
                3'b110: RD2_SEL = 8'b0100_0000;
                3'b111: RD2_SEL = 8'b1000_0000;
                default: RD2_SEL = 8'b0000_0000;
            endcase
        end

    assign Read_Data_1 = RD1_row0 | RD1_row1 | RD1_row2 | RD1_row3 | RD1_row4 | RD1_row5 | RD1_row6 | RD1_row7;
    assign Read_Data_2 = RD2_row0 | RD2_row1 | RD2_row2 | RD2_row3 | RD2_row4 | RD2_row5 | RD2_row6 | RD2_row7;

    assign RAMrow0 = RAM_row0;
    assign RAMrow1 = RAM_row1;
    assign RAMrow2 = RAM_row2;
    assign RAMrow3 = RAM_row3;
    assign RAMrow4 = RAM_row4;
    assign RAMrow5 = RAM_row5;
    assign RAMrow6 = RAM_row6;
    assign RAMrow7 = RAM_row7;
endmodule
