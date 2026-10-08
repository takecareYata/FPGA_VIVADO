`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 16:41:00
// Design Name: 
// Module Name: tb_full_adder_7bit
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


`timescale 1ns / 1ps

module tb_full_adder_7bit;

    // Testbench 입력 레지스터 및 출력 와이어 선언
    reg [6:0] a;
    reg [6:0] b;
    reg cin;

    wire [6:0] sum;
    wire cout;

    // DUT (Device Under Test) 인스턴스화
    full_adder_7bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 7'd10; b = 7'd20; cin = 1'b0; #10;
        a = 7'd10; b = 7'd20; cin = 1'b1; #10;
        a = 7'd15; b = 7'd0; cin = 1'b0; #10;
        a = 7'd15; b = 7'd0; cin = 1'b1; #10;
        $finish;
    end

endmodule