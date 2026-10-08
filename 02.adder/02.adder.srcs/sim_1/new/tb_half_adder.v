`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 14:05:37
// Design Name: 
// Module Name: tb_half_adder
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


module tb_half_adder();
    reg i_a, i_b;
    wire o_sum, o_cout;

    half_adder u(
        .a(i_a), 
        .b(i_b),
        .sum(o_sum), 
        .cout(o_cout)
    );

    initial begin
        #00 i_a = 1'b0; i_b = 1'b0;
        #10 i_a = 1'b0; i_b = 1'b1;
        #10 i_a = 1'b1; i_b = 1'b0;
        #10 i_a = 1'b1; i_b = 1'b1;
        #10 $finish;
    end

endmodule
