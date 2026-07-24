module Program_Counter (
    input wire clk,
    input wire reset,
    input wire [2:0] I,
    output wire [2:0] O
);
    reg [2:0] DFF;
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
            DFF <= 3'b000;    
        else 
            DFF <= I;               
    end

    assign O = DFF;

endmodule