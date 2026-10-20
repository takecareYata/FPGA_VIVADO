`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/19 11:23:17
// Design Name: 
// Module Name: tb_moor_fsm_101
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


module tb_moor_fsm_101();

    reg clk = 0;
    reg reset = 1;
    reg x = 0; //입력
    wire y; //출력

    reg r_error = 1'b0;

    moor_fsm_101 u_tb_moor_fsm_101(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    always #5 clk = ~clk; // 100MHz clk 생성


    // 상승엣지 전에 출력 y가 변하는 지 검사하는 것(moore 상태)
    // 상승엣지 후에 출력 y가 기대하는 값인지 검사 (1clock 지연)
    task send_data(input a, input expect_val);
        begin
            x = a;
            #1;
            @(posedge clk);
            #1;
            if (y !== expect_val) begin // y가 기대값이 아닌 다른 값이면 DUT에 logic error가 발생되었다.
                r_error = 1'b1; //error detect flag
                $display("Fail t = %0t , x = %b , y = %b , expect_val = %b", $time, a, y, expect_val);

            end 
        end
    endtask

    // 10101101 로 x 값 시뮬레이션
    initial begin
        #100;
        reset = 1;
        #100;
        reset = 0;

        send_data(1,0);
        send_data(0,0);
        send_data(1,1); // 101 : 다음 엣지 후 y = 1 (S3 단계)

        send_data(0,0);
        send_data(1,1); // 10101 : 중첩 검증

        send_data(1,0);
        send_data(0,0);
        send_data(1,1); // 1101 검증

        if (r_error == 0) begin
            $display ("PASS moor fsm_101");
        end 
        else $display("FAIL moor fsm_101");

        $finish;
    end


endmodule
