`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/16 14:38:00
// Design Name: 
// Module Name: top_up_counter
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

module top_up_counter(
    input wire clk,         
    input wire reset,        
    input wire btnU,         
    input wire btnD,         
    output wire [15:0] led   
);

    wire [1:0] w_clean_btn;

    button_debounce u_debounce (
        .clk(clk),
        .reset(reset),
        .btnU(btnU),
        .btnD(btnD),
        .clean_btn(w_clean_btn)  
    );

    up_counter u_counter (
        .clk(clk),
        .reset(reset),
        .btnU(w_clean_btn[0]),
        .btnD(w_clean_btn[1]),
        .led(led)
    );

endmodule
