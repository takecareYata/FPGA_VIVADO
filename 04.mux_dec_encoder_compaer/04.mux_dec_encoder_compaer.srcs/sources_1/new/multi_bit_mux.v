`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 13:22:32
// Design Name: 
// Module Name: multi_bit_mux
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
module mux4bit (a, b, sel, out, led); 
    input [3:0] a, b;
    input       sel;
    
    output [7:0] led;
    output [3:0] out;
    reg [3:0]    out;

    always @(sel or a or b) begin 
        case (sel)
            1'b0 : out = b; // sel이 0일 때 b 선택
            1'b1 : out = a; // sel이 1일 때 a 선택
            default: out = 4'bx;
        endcase
    end 

    assign led[3:0] = a;  // led[3:0]에 스위치 a 연결
    assign led[7:4] = b;  // led[7:4]에 스위치 b 연결
    //assign led = {b, a};

endmodule

