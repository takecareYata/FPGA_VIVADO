`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 15:55:16
// Design Name: 
// Module Name: tick_generator
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

module tick_generator #(
    parameter DIV = 100000
)(
    input wire clk,
    input wire reset,
    output reg tick
    );

    reg [$clog2(DIV)-1:0] r_counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_counter <= 0;
            tick  <= 1'b0;
        end 
        else begin
            if (r_counter == (DIV - 1)) begin
                r_counter <= 0;
                tick  <= 1'b1;
            end 
            else begin
                r_counter <= r_counter + 1;
                tick  <= 1'b0;
            end
        end
    end

endmodule
