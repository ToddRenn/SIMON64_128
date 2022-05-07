module keyBox(Ki3, Ki1, Ki, zj, out_Ki1);

    parameter WIDTH = 32-1;

    output wire [0:WIDTH] out_Ki1;
    input [0:WIDTH] Ki3, Ki1, Ki, zj;

    wire  [0:WIDTH] C_val = 32'b11111111111111111111111111111100;


    wire [0:WIDTH] rShift3, rShift4, A, B, C;

    assign rShift3 = {Ki3[3:31], Ki3[0:2]};
    assign A = Ki1 ^ rShift3;
    assign rShift1 = {A[1:31], A[0]};
    assign B = A^ Ki;
    assign C = B^ rShift1;
    assign out_Ki1 = C ^ zj ^ C_val; 
    
endmodule