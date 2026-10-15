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

module tick_generator(
    input wire clk,
    input wire reset,
    output reg tick_1ms
    );

    // 100MHz 클록에서 1ms를 만들기 위한 카운터 (100,000 클록 주기)
    reg [$clog2(100000)-1:0] r_counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_counter <= 0;
            tick_1ms  <= 1'b0;
        end 
        else begin
            if (r_counter == (100000 - 1)) begin
                r_counter <= 0;
                tick_1ms  <= 1'b1;
            end 
            else begin
                r_counter <= r_counter + 1;
                tick_1ms  <= 1'b0;
            end
        end
    end

endmodule
