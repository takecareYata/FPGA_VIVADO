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

module button_debounce #(
    parameter DIV = 1000000
)(
    input wire clk,
    input wire reset,
    input wire btnU,
    input wire btnD,
    output reg [1:0] clean_btn
);

    reg [$clog2(DIV)-1:0] r_count_u;
    reg [$clog2(DIV)-1:0] r_count_d;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_count_u    <= 0;
            clean_btn[0] <= 1'b0;
        end 
        else if (r_count_u == DIV - 1) begin
            r_count_u    <= 0;
            clean_btn[0] <= btnU;
        end 
        else begin
            r_count_u    <= r_count_u + 1;
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_count_d    <= 0;
            clean_btn[1] <= 1'b0;
        end 
        else if (r_count_d == DIV - 1) begin
            r_count_d    <= 0;
            clean_btn[1] <= btnD;
        end 
        else begin
            r_count_d    <= r_count_d + 1;
        end
    end

endmodule