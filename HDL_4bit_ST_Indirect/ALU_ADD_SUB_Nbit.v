module ALU_ADD_SUB_Nbit 
(
    input wire [3:0] A,B,
    input wire Sel,      
    output wire [3:0] R,    
    output wire CF
);

    wire [3:0] B_complement;
    wire [3:0] B_selected;

    assign B_complement = ~B + 4'b0001;

    assign B_selected = (Sel) ? B_complement : B;

    assign {CF, R} = A + B_selected;

endmodule