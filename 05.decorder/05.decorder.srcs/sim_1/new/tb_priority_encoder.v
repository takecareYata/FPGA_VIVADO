`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 16:10:31
// Design Name: 
// Module Name: tb_priority_encoder
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


`timescale 1ns/1ps

module tb_priority_encoder();

    // 입력 신호
    reg [3:0] a;
    // 출력 신호
    wire [1:0] led;
    wire       v;

    //인스턴스
    priority_encoder u_encoder (
        .a(a),
        .led(led),
        .v(v)
    );

    // 테스트 시나리오
    initial begin
        // 16가지 모든 경우의 수
        a = 4'b0000; 
        #10;
        a = 4'b0001; 
        #10;
        a = 4'b0010; 
        #10;
        a = 4'b0011; 
        #10;
        a = 4'b0100; 
        #10;
        a = 4'b0101; 
        #10;
        a = 4'b0110; 
        #10;
        a = 4'b0111; 
        #10;
        a = 4'b1000; 
        #10;
        a = 4'b1001; 
        #10;
        a = 4'b1010; 
        #10;
        a = 4'b1011; 
        #10;
        a = 4'b1100; 
        #10;
        a = 4'b1101; 
        #10;
        a = 4'b1110; 
        #10;
        a = 4'b1111; 
        #10;
        $finish;
    end

endmodule
