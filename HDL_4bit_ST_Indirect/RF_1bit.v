module RF_1bit (
    input wire clk,
    input wire reset,
    input wire Din,
    input wire Sel,  
    output wire Dout
);
    reg DFF;
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
            DFF <= 1'b0;       
        else if (Sel) 
            DFF <= Din;               
    end

    assign Dout = DFF;

endmodule
