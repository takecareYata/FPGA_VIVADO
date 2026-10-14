`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 16:44:41
// Design Name: 
// Module Name: tb_add_sub_4bit
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
module tb_add_sub_4bit();

    // 입력 신호
    reg [3:0] a;
    reg [3:0] b;
    reg       add_nsub;

    // 출력 신호
    wire [3:0] sum;
    wire       carry_out;

    add_sub_4bit u_add_sub (
        .a(a),
        .b(b),
        .add_nsub(add_nsub),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        // 초기값 설정
        a        = 4'b0000;
        b        = 4'b0000;
        add_nsub = 1'b1; // 기본 가산 모드

        #10; a = 4'b0101; b = 4'b0011; add_nsub = 1'b1;
        #10; a = 4'b1111; b = 4'b0001; add_nsub = 1'b1; 
        #10; a = 4'b1010; b = 4'b0101; add_nsub = 1'b1; 

        #10; a = 4'b1010; b = 4'b0011; add_nsub = 1'b0; 
        #10; a = 4'b0101; b = 4'b1000; add_nsub = 1'b0; 
        #10; a = 4'b1111; b = 4'b1111; add_nsub = 1'b0; 

        #10;
        $finish;
    end

endmodule
