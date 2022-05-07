module simonEncrypt(input_Val, keySeed, encrypted_Val);

    output wire [0:63] encrypted_Val;
    input wire [0:63] input_Val;
    input wire [0:127] keySeed;


    //get keys
    wire [0:31] k1,k2	,k3	,k4	,k5	,k6	,k7	,k8	,k9	,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44;
    keyGen kg1 (keySeed, k1,k2,k3	,k4	,k5	,k6	,k7	,k8	,k9	,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44);

    //run through the simon Round 44 times
    wire [0:63] simR01, simR02, simR03, simR04, simR05, simR06, simR07, 	simR08, 	simR09, 	simR10, 	simR11, 	simR12, 	simR13, 	simR14, 	simR15, 	simR16, 	simR17, 	simR18, 	simR19, 	simR20, 	simR21, 	simR22, 	simR23, 	simR24, 	simR25, 	simR26, 	simR27, 	simR28, 	simR29, 	simR30, 	simR31, 	simR32, 	simR33, 	simR34, 	simR35, 	simR36, 	simR37, 	simR38, 	simR39, 	simR40, 	simR41, 	simR42, 	simR43, 	simR44;

    simonRound sr1 (.PT(input_Val), .Key(k1), .CT(simR01));
    simonRound sr2 (.PT(simR01), .Key(k2), .CT(simR02));
    simonRound sr3 (.PT(simR02), .Key(k3), .CT(simR03));
    simonRound sr4 (.PT(simR03), .Key(k4), .CT(simR04));
    simonRound sr5 (.PT(simR04), .Key(k5), .CT(simR05));
    simonRound sr6 (.PT(simR05), .Key(k6), .CT(simR06));
    simonRound sr7 (.PT(simR06), .Key(k7), .CT(simR07));
    simonRound sr8 (.PT(simR07), .Key(k8), .CT(simR08));
    simonRound sr9 (.PT(simR08), .Key(k9), .CT(simR09));
    simonRound sr10 (.PT(simR09), .Key(k10), .CT(simR10));
    simonRound sr11 (.PT(simR10), .Key(k11), .CT(simR11));
    simonRound sr12 (.PT(simR11), .Key(k12), .CT(simR12));
    simonRound sr13 (.PT(simR12), .Key(k13), .CT(simR13));
    simonRound sr14 (.PT(simR13), .Key(k14), .CT(simR14));
    simonRound sr15 (.PT(simR14), .Key(k15), .CT(simR15));
    simonRound sr16 (.PT(simR15), .Key(k16), .CT(simR16));
    simonRound sr17 (.PT(simR16), .Key(k17), .CT(simR17));
    simonRound sr18 (.PT(simR17), .Key(k18), .CT(simR18));
    simonRound sr19 (.PT(simR18), .Key(k19), .CT(simR19));
    simonRound sr20 (.PT(simR19), .Key(k20), .CT(simR20));
    simonRound sr21 (.PT(simR20), .Key(k21), .CT(simR21));
    simonRound sr22 (.PT(simR21), .Key(k22), .CT(simR22));
    simonRound sr23 (.PT(simR22), .Key(k23), .CT(simR23));
    simonRound sr24 (.PT(simR23), .Key(k24), .CT(simR24));
    simonRound sr25 (.PT(simR24), .Key(k25), .CT(simR25));
    simonRound sr26 (.PT(simR25), .Key(k26), .CT(simR26));
    simonRound sr27 (.PT(simR26), .Key(k27), .CT(simR27));
    simonRound sr28 (.PT(simR27), .Key(k28), .CT(simR28));
    simonRound sr29 (.PT(simR28), .Key(k29), .CT(simR29));
    simonRound sr30 (.PT(simR29), .Key(k30), .CT(simR30));
    simonRound sr31 (.PT(simR30), .Key(k31), .CT(simR31));
    simonRound sr32 (.PT(simR31), .Key(k32), .CT(simR32));
    simonRound sr33 (.PT(simR32), .Key(k33), .CT(simR33));
    simonRound sr34 (.PT(simR33), .Key(k34), .CT(simR34));
    simonRound sr35 (.PT(simR34), .Key(k35), .CT(simR35));
    simonRound sr36 (.PT(simR35), .Key(k36), .CT(simR36));
    simonRound sr37 (.PT(simR36), .Key(k37), .CT(simR37));
    simonRound sr38 (.PT(simR37), .Key(k38), .CT(simR38));
    simonRound sr39 (.PT(simR38), .Key(k39), .CT(simR39));
    simonRound sr40 (.PT(simR39), .Key(k40), .CT(simR40));
    simonRound sr41 (.PT(simR40), .Key(k41), .CT(simR41));
    simonRound sr42 (.PT(simR41), .Key(k42), .CT(simR42));
    simonRound sr43 (.PT(simR42), .Key(k43), .CT(simR43));
    simonRound sr44 (.PT(simR43), .Key(k44), .CT(encrypted_Val));

endmodule