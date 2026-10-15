`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 14:25:52
// Design Name: 
// Module Name: D_FF
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


module D_FF(
    input  wire clk, // 80Hz
    input  wire reset,
    input  wire D,
    output reg  Q
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 0;
        end
        else begin
            Q <= D;
        end
    end

endmodule
