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
    input wire btnC,
    output clean_btn
    );

    wire w_clk;
    wire w_Q1;
    wire w_Q2;
    wire w_Q2_bar;

    clock_80Hz u_clock_80Hz(
        .clk(clk), // 100MHz
        .reset(reset),
        .oclk(w_clk) // 80Hz
    );

    D_FF u1_D_FF(
        .clk(w_clk), // 80Hz
        .reset(reset),
        .D(btnC),
        .Q(w_Q1)
    );

    D_FF u2_D_FF(
        .clk(w_clk), // 80Hz
        .reset(reset),
        .D(w_Q1),
        .Q(w_Q2)
    );

    assign w_Q2_bar = ~(w_Q2);
    assign clean_btn = w_Q1 & w_Q2_bar;

endmodule
