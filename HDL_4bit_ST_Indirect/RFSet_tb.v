module RFSet_tb;
    reg clk;
    reg reset;
    reg [1:0] RA;
    reg [1:0] RB;
    reg RE;
    reg [1:0] WR;
    reg [2:0] WRD;
    wire [2:0] A;
    wire [2:0] B;
    reg [2:0] InD;
    reg InE;
    wire [2:0] OutD;
    wire [2:0] R0, R1, R2, R3;

    RFSet uut (
        .clk(clk),
        .reset(reset),
        .RA(RA),
        .RB(RB),
        .RE(RE),
        .WR(WR),
        .WRD(WRD),
        .A(A),
        .B(B),
        .InD(InD),
        .InE(InE),
        .OutD(OutD),
        .R0(R0),
        .R1(R1),
        .R2(R2),
        .R3(R3)
    );

    always 
    begin
        clk = ~clk; 
        #5;
    end 

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, RFSet_tb);

        clk = 0;
        reset = 1;  
        RA = 2'b00;
        RB = 2'b00;
        RE = 0;
        WR = 2'b00;
        WRD = 3'b000;
        #10;

        reset = 0;  
        #10;

        RE = 1; 
        
        WR = 2'b00; WRD = 3'b101; RA = 2'b00; RB = 2'b00; 
        #10;

        WR = 2'b01; WRD = 3'b011; RA = 2'b01; RB = 2'b01; 
        #10;

        WR = 2'b10; WRD = 3'b010; RA = 2'b10; RB = 2'b10; 
        #10;

        WR = 2'b11; WRD = 3'b111; RA = 2'b11; RB = 2'b11; 
        #10;

        RE = 0; 

        WR = 2'b00; WRD = 3'b111; RA = 2'b00; RB = 2'b00; 
        #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | RA = %b | RB = %b | WR = %b | WRD = %b | RE = %b | A = %b | B = %b \n\t| R0 = %b | R1 = %b | R2 = %b | R3 = %b\n", 
                                    $time, clk, reset, RA, RB, WR, WRD, RE, A, B, R0, R1, R2, R3);
    end

endmodule
