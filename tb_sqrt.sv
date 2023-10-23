module tb_sqrt ();

    parameter CLK_PERIOD = 10;
    parameter WIDTH = 8;

    logic clk;
    logic start;             // start signal
    logic busy;              // calculation in progress
    logic valid;             // root and rem are valid
    logic [WIDTH-1:0] rad;   // radicand
    logic [WIDTH-1:0] root;  // root
    logic [WIDTH-1:0] rem;   // remainder

    square_root #(.WIDTH(WIDTH)) sqrt_inst (.*);

    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
                clk = 1;

        #100    rad = 8'b00000000;  // 0
                start = 1;
        #10     start = 0;

        #50     rad = 8'b00000001;  // 1
                start = 1;
        #10     start = 0;

        #50     rad = 8'b01111001;  // 121
                start = 1;
        #10     start = 0;

        #50     rad = 8'b01010001;  // 81
                start = 1;
        #10     start = 0;

        #50     rad = 8'b01011010;  // 90
                start = 1;
        #10     start = 0;

        #50     rad = 8'b11111111;  // 255
                start = 1;
        #10     start = 0;

        #50     $finish;
    end
endmodule