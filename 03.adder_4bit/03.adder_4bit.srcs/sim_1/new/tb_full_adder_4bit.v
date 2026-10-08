`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 16:26:31
// Design Name: 
// Module Name: tb_full_adder_4bit
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

module tb_full_adder_4bit;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    full_adder_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 4'd0; b = 4'd0; cin = 1'b0;
        #10;

        a = 4'd5; b = 4'd3; cin = 1'b0;
        #10;

        a = 4'd5; b = 4'd3; cin = 1'b1;
        #10;

        a = 4'b0111; b = 4'b0001; cin = 1'b0;
        #10;

        a = 4'b1111; b = 4'b0001; cin = 1'b0;
        #10;

        a = 4'b1111; b = 4'b1111; cin = 1'b1;
        #10;

        // 시뮬레이션 종료
        $finish;
    end

endmodule