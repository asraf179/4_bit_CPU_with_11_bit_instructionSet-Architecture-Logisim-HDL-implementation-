module RFSet (
    input wire clk,
    input wire reset,
    input wire [1:0] RA,
    input wire [1:0] RB,
    input wire RE,  
    input wire [1:0] WR,  
    input wire [3:0] WRD,
    output reg [3:0] A,
    output reg [3:0] B,
    input wire [3:0] InD,
    input wire InE,
    output wire [3:0] OutD,
    output wire [3:0] R0,
    output wire [3:0] R1,
    output wire [3:0] R2,
    output wire [3:0] R3
);

    wire [3:0] R00, R01, R10, R11;
    reg [3:0] WR_SEL;

    RF_Nbit Reg00 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[0]), .Dout(R00));
    RF_Nbit Reg01 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[1]), .Dout(R01));
    RF_Nbit Reg10 (.clk(clk), .reset(reset), .Din(InD), .Sel(InE), .Dout(R10));
    RF_Nbit Reg11 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[3]), .Dout(R11));

    always @(*) 
       begin
            case ({RE, WR})
                3'b100: WR_SEL = 4'b0001;  
                3'b101: WR_SEL = 4'b0010; 
                3'b111: WR_SEL = 4'b1000;  
                default: WR_SEL = 4'b0000; 
            endcase
        end 

    always @(*) 
        begin
            case (RA)
                2'b00: A = R00;
                2'b01: A = R01;
                2'b10: A = R10;
                2'b11: A = R11;
                default: A = 4'b0000;
            endcase
        end

    always @(*) 
        begin
            case (RB)
                2'b00: B = R00;
                2'b01: B = R01;
                2'b10: B = R10;
                2'b11: B = R11;
                default: B = 4'b0000;
            endcase
        end
    
    assign R0 = R00;
    assign R1 = R01;
    assign R2 = R10;
    assign R3 = R11;

    assign OutD = R11;

endmodule
