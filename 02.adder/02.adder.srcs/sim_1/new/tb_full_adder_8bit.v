`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 16:17:23
// Design Name: 
// Module Name: tb_full_adder_8bit
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

module tb_full_adder_8bit;

    // Testbench 핀 선언 (DUT 입력은 reg, 출력은 wire)
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] sum;
    wire cout;

    // DUT (Device Under Test) 인스턴스화
    full_adder_8bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // 1. 초기화 및 기본 테스트 (0 + 0)
        a = 8'd0;
        b = 8'd0;
        #10;
        
        // 2. 임의의 수 테스트 (15 + 15 = 30)
        a = 8'd15;
        b = 8'd15;
        #10;

        // 3. 하위 4비트 경계 Carry 확인 (15 + 1 = 16) -> Bit 4(LD4) 점등 확인용
        a = 8'b0000_1111; // 15
        b = 8'b0000_0001; // 1
        #10;

        // 4. 다양한 값 테스트 (100 + 55 = 155)
        a = 8'd100;
        b = 8'd55;
        #10;

        // 5. 모든 스위치 ON 테스트 (255 + 255 = 510 -> sum: 254, cout: 1)
        a = 8'hFF; // 8'b1111_1111
        b = 8'hFF; // 8'b1111_1111
        #10;

        // 시뮬레이션 종료
        $finish;
    end

endmodule
