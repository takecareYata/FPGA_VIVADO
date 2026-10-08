`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 16:34:25
// Design Name: 
// Module Name: full_adder_7bit
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

module full_adder_7bit(
    input [6:0] a,
    input [6:0] b,
    input cin,
    output [6:0] sum,
    output cout
);

    wire w_carry3, w_carry4, w_carry5;

    // 하위 4비트 가산기 (Bit 0~3)
    full_adder_4bit FA4 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(w_carry3)
    );

    // 상위 3비트 가산기 (Bit 4~6)
    full_adder FA4_bit (
        .a(a[4]),
        .b(b[4]),
        .cin(w_carry3),
        .sum(sum[4]),
        .cout(w_carry4)
    );

    full_adder FA5_bit (
        .a(a[5]),
        .b(b[5]),
        .cin(w_carry4),
        .sum(sum[5]),
        .cout(w_carry5)
    );

    full_adder FA6_bit (
        .a(a[6]),
        .b(b[6]),
        .cin(w_carry5),
        .sum(sum[6]),
        .cout(cout)
    );

endmodule
