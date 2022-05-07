`timescale 1ps/1ps

module simonDecrypt_tb;
		parameter WIDTH = 64;
		reg [63:0] A [0:46974]; 
		integer f_out,i,size;
		reg [63:0] indata  = 64'b0;
		wire [127:0] keySeedval = 128'b10110100011111101000111001011001011111100010110101010100111101000100100110101100100001010101111101010101011000101111010011100111;
		wire [63:0] outvalue;
		simonDecrypt encrypt1 (.input_Val(indata), .keySeed(keySeedval), .decrypted_Val(outvalue));

	initial begin
		$readmemb("bin_encrypt_simple.txt",A);
		f_out = $fopen("bin_decrypt_simple.txt","w");
		size = 2500; //#rows of file - look it up because Verilog doesnt recognize $size()
		
		for (i = 0; i<size; i=i+1)begin
			indata = A[i];
			#1
			$display("i=%d: indata=%b outdata=%b #remaining:%d",i,indata,outvalue,size-1-i);
			$fdisplay(f_out,"%b",outvalue);
		end
		$fclose(f_out);
		$stop;
	end
	
endmodule

