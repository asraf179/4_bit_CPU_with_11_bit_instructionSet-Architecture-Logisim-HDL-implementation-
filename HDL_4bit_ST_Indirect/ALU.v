module ALU
(
    input wire [3:0] A, B,                   
    input wire [1:0] OP,    
    output reg [3:0] R,     
    output wire CF,
    output wire SF,
    output wire ZF           
);

    reg Sel;
    wire [3:0] R_ADD_SUB, R_ROL;
    wire CF_ADD_SUB;

    ALU_ADD_SUB_Nbit ADD_SUB1 (.A(A), .B(B), .Sel(Sel), .R(R_ADD_SUB), .CF(CF_ADD_SUB));
    ALU_ROL_Nbit ROL1 (.A(A), .B(B), .R(R_ROL));

    always @(*) 
    begin
        case (OP)
            2'b00: // CMP 
                begin 
                    Sel = 1'b1;
                    R = R_ADD_SUB;
                end
            2'b10: // ROL
                begin 
                    R = R_ROL;
                end
            2'b11: // Addition
                begin
                    Sel = 1'b0;
                    R = R_ADD_SUB;
                end
            default: 
                begin
                    R = 4'b0000;
                    R = R_ADD_SUB;  
                end
        endcase
    end

    assign CF = (OP == 2'b00 || OP == 2'b11) ? CF_ADD_SUB : 1'b0;
    assign SF = R[3];
    assign ZF = ~(R[3] | R[2] | R[1] | R[0]);

endmodule
