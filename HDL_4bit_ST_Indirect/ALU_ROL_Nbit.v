module ALU_ROL_Nbit 
(
    input wire [3:0] A,B,  
    output reg [3:0] R
);

    wire [1:0] B2bit;
    assign B2bit = B[1:0];

    always @(*) begin
        case(B2bit)
            2'b00: R = A;                   
            2'b01: R = {A[2:0], A[3]};        
            2'b10: R = {A[1:0], A[3:2]};       
            2'b11: R = {A[0], A[3:1]};        
            default: R = A;                   
        endcase
    end
    
endmodule