`timescale 1ns / 1ps // => 타이밍최소단위 / 반올림할 값 수준
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/06 16:22:03
// Design Name: 
// Module Name: gates
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//#1
// module gates(
//     input a,
//     input b,
//     output ld0,
//     output ld1,
//     output ld2,
//     output ld3,
//     output ld4,
//     output ld5
//     );

//     assign ld0 = a & b;
//     assign ld1 = a | b;
//     assign ld2 = ~(a & b); // NAND
//     assign ld3 = ~(a | b); // NOR
//     assign ld4 = a ^ b; // XOR
//     assign ld5 = ~a; // NOT
// endmodule

//#2
// module gates(
//     input a,
//     input b, ///default wire로 인식함
//     output [5:0] led
//     );

//     assign led[0] = a & b;
//     assign led[1] = a | b;
//     assign led[2] = ~(a & b); // NAND
//     assign led[3] = ~(a | b); // NOR
//     assign led[4] = a ^ b; // XOR
//     assign led[5] = ~a; // NOT
// endmodule

//#3
module gates(
    input [1:0] sw,
    output [5:0] led
    );

    assign led[0] = sw[0] & sw[1];
    assign led[1] = sw[0] | sw[1];
    assign led[2] = ~(sw[0] & sw[1]); // NAND
    assign led[3] = ~(sw[0] | sw[1]); // NOR
    assign led[4] = sw[0] ^ sw[1]; // XOR
    assign led[5] = ~sw[0]; // NOT
endmodule