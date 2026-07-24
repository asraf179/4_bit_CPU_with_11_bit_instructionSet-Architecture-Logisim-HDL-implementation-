module CPU_tb;
    reg clk;
    reg reset;
    reg PC_Enable;
    reg [10:0] RAM_Write_Data;
    reg [2:0] RAM_Write_Address;
    reg RAM_Write_Enable;
    reg [3:0] InD;
    reg InE;
    wire [3:0] OutD;
    wire [2:0] PC;
    wire [10:0] PI;
    wire [3:0] REG0, REG1, REG2, REG3;
    wire [10:0] RAM0, RAM1, RAM2, RAM3;
    wire [10:0] RAM4, RAM5, RAM6, RAM7;

    CPU uut (
        .clk(clk), .reset(reset), .PC_Enable(PC_Enable), .PC(PC), .PI(PI),
        .RAM_Write_Data(RAM_Write_Data),
        .RAM_Write_Address(RAM_Write_Address),
        .RAM_Write_Enable(RAM_Write_Enable),
        .InD(InD), .InE(InE), .OutD(OutD),
        .REG0(REG0), .REG1(REG1), .REG2(REG2), .REG3(REG3),
        .RAM0(RAM0), .RAM1(RAM1), .RAM2(RAM2), .RAM3(RAM3),
        .RAM4(RAM4), .RAM5(RAM5), .RAM6(RAM6), .RAM7(RAM7)
    );

    always 
    begin
        #5 clk = ~clk; 
    end 

    initial begin
        clk = 0;
        reset = 1;
        PC_Enable = 0;
        RAM_Write_Data = 0;
        RAM_Write_Address = 0;
        RAM_Write_Enable = 0;
        InD = 0;
        InE = 0;
        #10;

        reset = 0;
        #10;

        InD = 4'b0100;
        InE = 1'b1;
        PC_Enable = 0;
        RAM_Write_Enable = 1;

        RAM_Write_Address = 3'b000;   
        RAM_Write_Data = 11'b0011_00_00_10_0;  // ADD R0, INR ;INR = R2
        #10;

        RAM_Write_Address = 3'b001;
        RAM_Write_Data = 11'b0000_01_00_100;  // CMP R0, 4
        #10;

        RAM_Write_Address = 3'b010;   
        RAM_Write_Data = 11'b0001_00_00_101;  // JMP EXIT
        #10;

        RAM_Write_Address = 3'b011;   
        RAM_Write_Data = 11'b0000_10_00_010;  // SHL R0, 2
        #10;

        RAM_Write_Address = 3'b100;
        RAM_Write_Data = 11'b11_00_0011_00_0;  // ADD OUTR, R0 ;OUTR = R3
        #10;

        RAM_Write_Address = 3'b101;
        RAM_Write_Data = 11'b00_0000_01_111;  // ADD R1, 7 
        #10;

        RAM_Write_Address = 3'b110;
        RAM_Write_Data = 11'b1000_00_00_01_0;  // STORE [R1], R0 
        #10;

        RAM_Write_Enable = 0;
        PC_Enable = 1;
        #60;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | PC_Enable = %b | PC = %b | PI = %b | RAM_E = %b | RAM_D = %b | RAM_A = %b | InE = %b | \n\t| InD = %b | OutD = %b | REG0 = %b | REG1 = %b | REG2 = %b | REG3 = %b | RAM0 = %b | RAM1 = %b |\n\t RAM2 = %b | RAM3 = %b | RAM4 = %b | RAM5 = %b | RAM6 = %b | RAM7 = %b\n", 
                    $time, clk, reset, PC_Enable, PC, PI, RAM_Write_Enable, RAM_Write_Data, RAM_Write_Address, InE, InD, OutD, REG0, REG1, REG2, REG3, RAM0, RAM1, RAM2, RAM3, RAM4, RAM5, RAM6, RAM7);
    end

endmodule
