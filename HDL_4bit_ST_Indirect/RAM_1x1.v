module RAM_1x1bit (
    input wire clk,
    input wire reset,
    input wire Write_Data,
    input wire Write_Select,  
    input wire Read_Select_1,  
    input wire Read_Select_2,
    output wire Read_Data_1,
    output wire Read_Data_2,
    output wire RAM1bit_data
);
    reg DFF;
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
            DFF <= 1'b0;       
        else if (Write_Select) 
            DFF <= Write_Data;               
    end

    assign Read_Data_1 = (Read_Select_1)? DFF : 1'b0;
    assign Read_Data_2 = (Read_Select_2)? DFF : 1'b0;
    assign RAM1bit_data = DFF;

endmodule
