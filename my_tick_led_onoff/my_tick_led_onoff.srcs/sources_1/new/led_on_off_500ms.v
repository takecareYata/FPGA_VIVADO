`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 15:53:55
// Design Name: 
// Module Name: led_on_off_500ms
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

module led_on_off_500ms(
    input  wire tick_1ms,
    output wire led1
    );

    reg [$clog2(500)-1:0] r_counter = 0;
    reg r_led = 1'b0;

    always @(posedge tick_1ms) begin
        if (r_counter == 500 - 1) begin
            r_counter <= 0;
            r_led     <= ~r_led;
        end 
        else begin
            r_counter <= r_counter + 1;
        end
    end

    assign led1 = r_led;

endmodule
