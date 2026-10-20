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
    output led
    );

    wire w_clean_btn;

    debouncer u_button_debounce(
        .clk(clk),
        .reset(reset),
        .noisy_btn(btnC),
        .clean_btn(w_clean_btn)
    );

    led_toggle u_led_toggle(
        .clean_btn(w_clean_btn),
        .led(led)
    );

endmodule
