`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/16 11:50:05
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
    input wire reset,
    input wire btn,
    output wire led
);

    reg r_toggle = 1'b0;

    always @(posedge btn or posedge reset) begin
        if (reset) begin
            r_toggle <= 1'b0;
        end else begin
            r_toggle <= ~r_toggle;
        end
    end

    assign led = r_toggle;

endmodule