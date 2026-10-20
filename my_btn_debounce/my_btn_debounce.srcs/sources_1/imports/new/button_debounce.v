`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 14:19:12
// Design Name: 
// Module Name: button_debounce
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

module button_debounce(
    input wire clk,   
    input wire reset,
    input wire btn,
    output reg clean_btn
    );
     reg [$clog2(10)-1:0] r_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_count   <= 0;
            clean_btn <= 0;
        end 
        else if (r_count == 10 - 1) begin
            r_count   <= 0;
            clean_btn <= btn;
        end 
        else begin
            r_count <= r_count + 1;
        end
    end

endmodule