`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 15:33:48
// Design Name: 
// Module Name: full_adder_8bit
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

module full_adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,          // 1bit Carry-in
    output [7:0] sum,
    output cout         // 1bit Carry-out
);

    wire w_carry; // 하위 4비트 가산기에서 상위 4비트 가산기로 전달되는 Carry

    // 하위 4비트 가산기 (Bit 0~3)
    full_adder_4bit FA4_LOW (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(1'b0),          // 외부 cin 입력 전달
        .sum(sum[3:0]),
        .cout(w_carry)      // 중간 Carry 발생
    );

    // 상위 4비트 가산기 (Bit 4~7)
    full_adder_4bit FA4_HIGH (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(w_carry),      // 하위 4비트에서 발생한 Carry 입력
        .sum(sum[7:4]),
        .cout(cout)         // 최종 Carry-out
    );

endmodule