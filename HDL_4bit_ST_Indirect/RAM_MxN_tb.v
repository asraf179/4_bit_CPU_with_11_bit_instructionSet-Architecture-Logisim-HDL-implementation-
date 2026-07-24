module RAM_MxNbit_tb();
    reg clk;
    reg reset;
    reg [10:0] Write_Data;
    reg [2:0] Write_Address;
    reg Write_Enable;
    reg [2:0] Read_Address_1;
    reg [2:0] Read_Address_2;
    wire [10:0] Read_Data_1;
    wire [10:0] Read_Data_2;
    wire [10:0] RAMrow0, RAMrow1, RAMrow2, RAMrow3, RAMrow4, RAMrow5, RAMrow6, RAMrow7;

    RAM_MxNbit dut (
        .clk(clk),
        .reset(reset),
        .Write_Data(Write_Data),
        .Write_Address(Write_Address),
        .Write_Enable(Write_Enable),
        .Read_Address_1(Read_Address_1),
        .Read_Address_2(Read_Address_2),
        .Read_Data_1(Read_Data_1),
        .Read_Data_2(Read_Data_2),
        .RAMrow0(RAMrow0),
        .RAMrow1(RAMrow1),
        .RAMrow2(RAMrow2),
        .RAMrow3(RAMrow3),
        .RAMrow4(RAMrow4),
        .RAMrow5(RAMrow5),
        .RAMrow6(RAMrow6),
        .RAMrow7(RAMrow7)
    );

    always 
    begin
        #5 clk = ~clk; 
    end 

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, RAM_MxNbit_tb);

        clk = 0;
        reset = 1;  
        Write_Data = 11'b1100000_0000;
        Write_Address = 3'b000;
        Write_Enable = 0;
        Read_Address_1 = 3'b000;
        Read_Address_2 = 3'b000;
        #10;

        reset = 0;  
        #10;

        Write_Enable = 1;
        Write_Address = 3'b000; Write_Data = 11'b0000000_0001; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        #10;

        Write_Address = 3'b001; Write_Data = 11'b1100000_0011; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        #10;

        // Write_Address = 3'b010; Write_Data = 11'b00000_0100; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        // #10;

        // Write_Address = 3'b011; Write_Data = 11'b00000_1100; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        // #10;

        // Write_Address = 3'b100; Write_Data = 11'b00011_0000; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        // #10;

        // Write_Address = 3'b101; Write_Data = 11'b01100_0011; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        // #10;

        // Write_Address = 3'b110; Write_Data = 11'b00011_0011; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        // #10;

        // Write_Address = 3'b111; Write_Data = 11'b01111_0011; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        // #10;

        Write_Enable = 0;
        Write_Address = 3'b001; Write_Data = 11'b00000_0000; Read_Address_1 = 3'b000; Read_Address_2 = 3'b001;
        #10;

        $finish;
    end


    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | WE = %b | WA = %b | WD = %b | RA1 = %b | RD1 = %b | RA2 = %b | RD2 = %b\n\t | RAM0 = %b | RAM1 = %b  | RAM2 = %b  | RAM3 = %b  \n\t| RAM4 = %b  | RAM5 = %b  | RAM6 = %b  | RAM7 = %b\n", 
                 $time, clk, reset, Write_Enable, Write_Address, Write_Data, 
                                    Read_Address_1, Read_Data_1, Read_Address_2, Read_Data_2,
                                        RAMrow0, RAMrow1, RAMrow2, RAMrow3, RAMrow4, RAMrow5, RAMrow6, RAMrow7);
    end

endmodule
