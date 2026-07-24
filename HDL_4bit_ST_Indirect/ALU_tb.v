module ALU_tb;
    reg [3:0] A, B;       
    reg [1:0] OP;          
    wire [3:0] R;          
    wire CF;
    wire SF;
    wire ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, ALU_tb);

        A = 4'b0011; B = 4'b0011; OP = 2'b00;
        #10;

        A = 4'b0100; B = 4'b0010; OP = 2'b11;
        #10;

        A = 4'b0011; B = 4'b0010; OP = 2'b10;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b", $time, A, B, OP, R, CF, ZF, SF);
    end

endmodule
