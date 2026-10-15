`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 14:16:28
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
    input wire btnC,
    output [1:0] led
    );

    wire w_clean_btn;
    wire w_tick_1ms;

    button_debounce u_button_debounce(
        .clk(clk),
        .reset(reset),
        .btnC(btnC),
        .clean_btn(w_clean_btn)
    );

    led_toggle u_led_toggle(
        .clean_btn(w_clean_btn),
        .led(led[0])
    );

    tick_generator u_tick_generator(
        .clk(clk),
        .reset(reset),
        .tick_1ms(w_tick_1ms)
    );

    led_on_off_500ms u_led_on_off_500ms(
        .tick_1ms(w_tick_1ms),
        .led1(led[1])
    );

endmodule
