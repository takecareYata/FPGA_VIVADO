`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 10:24:16
// Design Name: 
// Module Name: rom
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


module rom (
    input  wire [3:0] addr,
    input  wire       oe,
    output reg  [7:0] data_out
);

    always @(*) begin
        if (!oe) begin
            data_out = 8'h00; 
        end else begin
            case (addr)
                4'h0: data_out = 8'h23;
                4'h1: data_out = 8'hF3;
                4'h2: data_out = 8'hA7;
                4'h3: data_out = 8'h04;
                4'h4: data_out = 8'h10;
                4'h5: data_out = 8'h11;
                4'h6: data_out = 8'h12;
                4'h7: data_out = 8'h13;
                4'h8: data_out = 8'h14;
                4'h9: data_out = 8'h15;
                4'hA: data_out = 8'h16;
                4'hB: data_out = 8'h17;
                4'hC: data_out = 8'h18;
                4'hD: data_out = 8'h19;
                4'hE: data_out = 8'h30;
                4'hF: data_out = 8'hD5;
                default: data_out = 8'h00;
            endcase
        end
    end

endmodule
