`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/07 11:27:39
// Design Name: 
// Module Name: tb_gates
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

//#1
// module tb_gates();
//     reg i_a; //reg 는 1bit 짜리 저장 메모리다.
//     reg i_b; 
//     wire [5:0] o_led;

//     //port 지정 : nameed port mapping 방식
//     gates u_gates( // u_gates 라는 이름으로 인스턴스 생성
//         .a(i_a),
//         .b(i_b),
//         .led(o_led)
//     );

//     // a b 값 변동
//     // 0 0
//     // 0 1
//     // 1 0
//     // 1 1
//     initial begin
//         #00 i_a = 1'b0; i_b = 1'b0; //#00 delay 없음
//         #20 i_a = 1'b0; i_b = 1'b1; //#20 20ns delay
//         #20 i_a = 1'b1; i_b = 1'b0;
//         #20 i_a = 1'b1; i_b = 1'b1; 
//         #20 $stop;
//     end

// endmodule

//#2

module tb_gates();
    reg [1:0] i_sw;
    wire [5:0] o_led;

    //port 지정 : nameed port mapping 방식
    gates u_gates( // u_gates 라는 이름으로 인스턴스 생성
        .sw(i_sw),
        .led(o_led)
    );

    // a b 값 변동
    // 0 0
    // 0 1
    // 1 0
    // 1 1
    initial begin
        #00 i_sw[0] = 1'b0; i_sw[1] = 1'b0; //#00 delay 없음
        #20 i_sw[0] = 1'b0; i_sw[1] = 1'b1; //#20 20ns delay
        #20 i_sw[0] = 1'b1; i_sw[1] = 1'b0;
        #20 i_sw[0] = 1'b1; i_sw[1] = 1'b1; 
        #20 $stop;
    end

endmodule
