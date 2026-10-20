`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/16 11:59:18
// Design Name: 
// Module Name: top_btn_debounce
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
module top_btn_debounce(
    input wire clk,
    input wire reset,
    input wire btnU,
    input wire btnD,
    input wire sel,
    output wire clean_btn,
    output wire [2:0] led
);

    wire w_tick;
    wire w_btn;

    tick_generator u_tick_generator (
        .clk(clk),
        .reset(reset),
        .tick(w_tick)
    );

    mux u_mux (
        .sel(sel),
        .btnU(btnU),
        .btnD(btnD),
        .btn(w_btn)
    );

    button_debounce u_button_debounce (
        .clk(w_tick),      
        .reset(reset),
        .btn(w_btn),
        .clean_btn(clean_btn)
    );

    led_toggle u_led_toggle (
        .reset(reset),
        .btn(clean_btn),
        .led(led[2])
    );

    assign led[0] = clean_btn;
    assign led[1] = 1'b0;

endmodule