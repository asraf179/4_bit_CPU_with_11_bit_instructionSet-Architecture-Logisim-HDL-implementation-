module CU (
    input wire [3:0] Opcode,
    input wire ZF,
    input wire SF,
    input wire CF,
    output wire [1:0] OP,
    output wire REG_EN,
    output wire IMM_SEL,
    output wire JMP_SEL,
    output wire ST_SEL
);

    assign OP = Opcode[1:0];
    assign IMM_SEL = (Opcode[3:2] == 2'b01)? 1'b1 : 1'b0;
    assign JMP_SEL = (Opcode[3:0] == 4'b0011 && ZF == 1'b0 && SF == 1'b0)? 1'b1 : 1'b0;
    assign ST_SEL = (Opcode[3:0] == 4'b1101)? 1'b1 : 1'b0;
    assign REG_EN = (Opcode[3:0] == 4'b1000 | Opcode[3:0] == 4'b0100 | Opcode[3:0] == 4'b1101 | Opcode[3:2] == 2'b00) ? 1'b0 : 1'b1;

endmodule