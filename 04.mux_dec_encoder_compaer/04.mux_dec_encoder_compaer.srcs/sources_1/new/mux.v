`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 11:24:37
// Design Name: 
// Module Name: mux
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
module mux2_1(a,b,sel,out);

    input a, b, sel;
    output out;
    
    reg r_out;

    always @(a,b,sel) begin
        case (sel)
            1'b1 : r_out = a;
            1'b0 : r_out = b;
            default: r_out = 1'bx;
        endcase
    end

    assign out = r_out;

endmodule
