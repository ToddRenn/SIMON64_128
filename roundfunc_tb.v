module roundfunc_tb;
    parameter WIDTH = 32-1;
    
    wire [0:2*WIDTH] indata  = 64'b1101000010100011011001010101001001010011100011100100000111101011;
    wire [0:WIDTH] key = 32'b10010001101110000010111100001100;

    wire [0:2*WIDTH] outvalue;
    ROUND_FUNC rf1 (.i_data(indata), .i_round_key(key), .o_data(outvalue));

  initial
     $monitor("At time %t,  (%b)",
              $time, outvalue);

endmodule