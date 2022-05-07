module simonRound(PT, Key, CT);

    parameter WIDTH = 32;
    output wire [0:(2*WIDTH)-1] CT;
    input [0:(2*WIDTH)-1] PT;
    input [0:WIDTH-1] Key;

    wire [0:WIDTH-1] PT1, PT2, CT1;
    wire [0:WIDTH-1] lShift1, lShift8, lShift2, andVal, xor1, xor2;   

    assign PT1 = PT[0:WIDTH-1];
    assign PT2 = PT[WIDTH:(2*WIDTH)-1];

    assign lShift1 = {PT1[1:WIDTH-1], PT1[0]};
    assign lShift8 = {PT1[8:WIDTH-1], PT1[0:7]};
    assign lShift2 = {PT1[2:WIDTH-1], PT1[0:1]};

    assign andVal = lShift1 & lShift8;
    assign xor1 = andVal ^ lShift2;
    assign xor2 = PT2 ^ xor1;
    assign CT1 = Key ^ xor2;
    assign CT = {CT1, PT1};

endmodule