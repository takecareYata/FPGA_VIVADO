`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 14:40:41
// Design Name: 
// Module Name: full_adder
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


// 1-bit Full Adder Module
module full_adder(   
    input a,          // 첫 번째 입력 비트    
    input b,          // 두 번째 입력 비트    
    input cin,        // 이전 자리에서 올라온 자리올림 입력    
    output sum,       // 합 출력    
    output cout 
    ); 
    
    wire w_sum1, w_cout1;
    wire w_sum2, w_cout2;

    half_adder u1_half_adder(
        .a(a), 
        .b(b),
        .sum(w_sum1), 
        .cout(w_cout1)
    );

    half_adder u2_half_adder(
        .a(w_sum1), 
        .b(cin),
        .sum(w_sum2), 
        .cout(w_cout2)
    );

   assign sum = w_sum2;       
   assign cout = w_cout1 | w_cout2;
endmodule
 

