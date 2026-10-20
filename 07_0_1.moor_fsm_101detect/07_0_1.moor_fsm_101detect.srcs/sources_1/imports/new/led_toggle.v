`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 14:28:22
// Design Name: 
// Module Name: led_toggle
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


module led_toggle(
    input  wire clean_btn,
    output wire  led
    );

    reg r_toggle = 1'b0;

    always @(posedge clean_btn) begin
        r_toggle <= ~(r_toggle);
    end

    assign led = (r_toggle == 1) ? 1'b1 : 1'b0;
endmodule
