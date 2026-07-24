module FLAG_Register
(
    input wire clk,
    input wire reset,
    input wire CF,
    input wire SF,
    input wire ZF,
    output wire dCF,
    output wire dSF,
    output wire dZF         
);

    reg CF_DFF, SF_DFF, ZF_DFF;
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset)
        begin
            CF_DFF <= 1'b0;       
            SF_DFF <= 1'b0;       
            ZF_DFF <= 1'b0;       
        end
        else 
        begin
            CF_DFF <= CF;       
            SF_DFF <= SF;       
            ZF_DFF <= ZF;       
        end
    end

    assign dCF = CF_DFF;
    assign dSF = SF_DFF;
    assign dZF = ZF_DFF;

endmodule