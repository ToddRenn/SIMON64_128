module keyGen(inkey,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11 ,k12 ,k13 ,k14 ,k15 ,k16 ,k17 ,k18 ,k19 ,k20 ,k21 ,k22 ,k23 ,k24 ,k25 ,k26 ,k27 ,k28 ,k29 ,k30 ,k31 ,k32 ,k33 ,k34 ,k35 ,k36 ,k37 ,k38 ,k39 ,k40 ,k41 ,k42 ,k43 ,k44);

    parameter WIDTH = 32-1;
    output wire [0:WIDTH] k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44;
    input wire [0:127] inkey;
    wire[0:62] zj = 62'b11011011101011000110010111100000010010001010011100110100001111;
    
    //generate zj values 
    wire [0:WIDTH] zj0 = zj[0:WIDTH+0];
    wire [0:WIDTH] zj1 = zj[1:WIDTH+1];
    wire [0:WIDTH] zj2 = zj[2:WIDTH+2];
    wire [0:WIDTH] zj3 = zj[3:WIDTH+3];
    wire [0:WIDTH] zj4 = zj[4:WIDTH+4];
    wire [0:WIDTH] zj5 = zj[5:WIDTH+5];
    wire [0:WIDTH] zj6 = zj[6:WIDTH+6];
    wire [0:WIDTH] zj7 = zj[7:WIDTH+7];
    wire [0:WIDTH] zj8 = zj[8:WIDTH+8];
    wire [0:WIDTH] zj9 = zj[9:WIDTH+9];
    wire [0:WIDTH] zj10 = zj[10:WIDTH+10];
    wire [0:WIDTH] zj11 = zj[11:WIDTH+11];
    wire [0:WIDTH] zj12 = zj[12:WIDTH+12];
    wire [0:WIDTH] zj13 = zj[13:WIDTH+13];
    wire [0:WIDTH] zj14 = zj[14:WIDTH+14];
    wire [0:WIDTH] zj15 = zj[15:WIDTH+15];
    wire [0:WIDTH] zj16 = zj[16:WIDTH+16];
    wire [0:WIDTH] zj17 = zj[17:WIDTH+17];
    wire [0:WIDTH] zj18 = zj[18:WIDTH+18];
    wire [0:WIDTH] zj19 = zj[19:WIDTH+19];
    wire [0:WIDTH] zj20 = zj[20:WIDTH+20];
    wire [0:WIDTH] zj21 = zj[21:WIDTH+21];
    wire [0:WIDTH] zj22 = zj[22:WIDTH+22];
    wire [0:WIDTH] zj23 = zj[23:WIDTH+23];
    wire [0:WIDTH] zj24 = zj[24:WIDTH+24];
    wire [0:WIDTH] zj25 = zj[25:WIDTH+25];
    wire [0:WIDTH] zj26 = zj[26:WIDTH+26];
    wire [0:WIDTH] zj27 = zj[27:WIDTH+27];
    wire [0:WIDTH] zj28 = zj[28:WIDTH+28];
    wire [0:WIDTH] zj29 = zj[29:WIDTH+29];
    wire [0:WIDTH] zj30 = {zj[30:61], zj[0:0]};
    wire [0:WIDTH] zj31 = {zj[31:61], zj[0:1]};
    wire [0:WIDTH] zj32 = {zj[32:61], zj[0:2]};
    wire [0:WIDTH] zj33 = {zj[33:61], zj[0:3]};
    wire [0:WIDTH] zj34 = {zj[34:61], zj[0:4]};
    wire [0:WIDTH] zj35 = {zj[35:61], zj[0:5]};
    wire [0:WIDTH] zj36 = {zj[36:61], zj[0:6]};
    wire [0:WIDTH] zj37 = {zj[37:61], zj[0:7]};
    wire [0:WIDTH] zj38 = {zj[38:61], zj[0:8]};
    wire [0:WIDTH] zj39 = {zj[39:61], zj[0:9]};


    //set starting key values
    wire [0:WIDTH] ki3 = inkey[0:31];
    wire [0:WIDTH] ki2 = inkey[32:63];
    wire [0:WIDTH] ki1 = inkey[64:95];
    wire [0:WIDTH] ki0 = inkey[96:127];

    assign k1 = ki0;
    assign k2 = ki1;
    assign k3 = ki2;
    assign k4 = ki3;
    keyBox box1(.Ki3(ki3), .Ki1(ki1), .Ki(ki0), .zj(zj0), .out_Ki1(k5));
    keyBox box2(.Ki3(k5), .Ki1(ki2), .Ki(ki1), .zj(zj1), .out_Ki1(k6));
    keyBox box3(.Ki3(k6), .Ki1(ki3), .Ki(ki2), .zj(zj2), .out_Ki1(k7));
    keyBox box4(.Ki3(k7), .Ki1(k5), .Ki(ki3), .zj(zj3), .out_Ki1(k8));
    keyBox box5(.Ki3(k8), .Ki1(k6), .Ki(k5), .zj(zj4), .out_Ki1(k9));
    keyBox box6(.Ki3(k9), .Ki1(k7), .Ki(k6), .zj(zj5), .out_Ki1(k10));
    keyBox box7(.Ki3(k10), .Ki1(k8), .Ki(k7), .zj(zj6), .out_Ki1(k11));
    keyBox box8(.Ki3(k11), .Ki1(k9), .Ki(k8), .zj(zj7), .out_Ki1(k12));
    keyBox box9(.Ki3(k12), .Ki1(k10), .Ki(k9), .zj(zj8), .out_Ki1(k13));
    keyBox box10(.Ki3(k13), .Ki1(k11), .Ki(k10), .zj(zj9), .out_Ki1(k14));
    keyBox box11(.Ki3(k14), .Ki1(k12), .Ki(k11), .zj(zj10), .out_Ki1(k15));
    keyBox box12(.Ki3(k15), .Ki1(k13), .Ki(k12), .zj(zj11), .out_Ki1(k16));
    keyBox box13(.Ki3(k16), .Ki1(k14), .Ki(k13), .zj(zj12), .out_Ki1(k17));
    keyBox box14(.Ki3(k17), .Ki1(k15), .Ki(k14), .zj(zj13), .out_Ki1(k18));
    keyBox box15(.Ki3(k18), .Ki1(k16), .Ki(k15), .zj(zj14), .out_Ki1(k19));
    keyBox box16(.Ki3(k19), .Ki1(k17), .Ki(k16), .zj(zj15), .out_Ki1(k20));
    keyBox box17(.Ki3(k20), .Ki1(k18), .Ki(k17), .zj(zj16), .out_Ki1(k21));
    keyBox box18(.Ki3(k21), .Ki1(k19), .Ki(k18), .zj(zj17), .out_Ki1(k22));
    keyBox box19(.Ki3(k22), .Ki1(k20), .Ki(k19), .zj(zj18), .out_Ki1(k23));
    keyBox box20(.Ki3(k23), .Ki1(k21), .Ki(k20), .zj(zj19), .out_Ki1(k24));
    keyBox box21(.Ki3(k24), .Ki1(k22), .Ki(k21), .zj(zj20), .out_Ki1(k25));
    keyBox box22(.Ki3(k25), .Ki1(k23), .Ki(k22), .zj(zj21), .out_Ki1(k26));
    keyBox box23(.Ki3(k26), .Ki1(k24), .Ki(k23), .zj(zj22), .out_Ki1(k27));
    keyBox box24(.Ki3(k27), .Ki1(k25), .Ki(k24), .zj(zj23), .out_Ki1(k28));
    keyBox box25(.Ki3(k28), .Ki1(k26), .Ki(k25), .zj(zj24), .out_Ki1(k29));
    keyBox box26(.Ki3(k29), .Ki1(k27), .Ki(k26), .zj(zj25), .out_Ki1(k30));
    keyBox box27(.Ki3(k30), .Ki1(k28), .Ki(k27), .zj(zj26), .out_Ki1(k31));
    keyBox box28(.Ki3(k31), .Ki1(k29), .Ki(k28), .zj(zj27), .out_Ki1(k32));
    keyBox box29(.Ki3(k32), .Ki1(k30), .Ki(k29), .zj(zj28), .out_Ki1(k33));
    keyBox box30(.Ki3(k33), .Ki1(k31), .Ki(k30), .zj(zj29), .out_Ki1(k34));
    keyBox box31(.Ki3(k34), .Ki1(k32), .Ki(k31), .zj(zj30), .out_Ki1(k35));
    keyBox box32(.Ki3(k35), .Ki1(k33), .Ki(k32), .zj(zj31), .out_Ki1(k36));
    keyBox box33(.Ki3(k36), .Ki1(k34), .Ki(k33), .zj(zj32), .out_Ki1(k37));
    keyBox box34(.Ki3(k37), .Ki1(k35), .Ki(k34), .zj(zj33), .out_Ki1(k38));
    keyBox box35(.Ki3(k38), .Ki1(k36), .Ki(k35), .zj(zj34), .out_Ki1(k39));
    keyBox box36(.Ki3(k39), .Ki1(k37), .Ki(k36), .zj(zj35), .out_Ki1(k40));
    keyBox box37(.Ki3(k40), .Ki1(k38), .Ki(k37), .zj(zj36), .out_Ki1(k41));
    keyBox box38(.Ki3(k41), .Ki1(k39), .Ki(k38), .zj(zj37), .out_Ki1(k42));
    keyBox box39(.Ki3(k42), .Ki1(k40), .Ki(k39), .zj(zj38), .out_Ki1(k43));
    keyBox box40(.Ki3(k43), .Ki1(k41), .Ki(k40), .zj(zj39), .out_Ki1(k44));

endmodule