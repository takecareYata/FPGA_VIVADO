`timescale 1ns / 1ps

module tb_moore_fsm_101;

  reg clk;
  reg reset;
  reg x;
  wire y;

  integer error_count;

  moore_fsm_101 u_moore_fsm_101 (
      .clk  (clk),
      .reset(reset),
      .x    (x),
      .y    (y)
  );

  // 100 MHz Clock 생성
  always #5 clk = ~clk;

  // 입력 1bit 적용 후 출력 확인
  task automatic apply_bit;
    input input_x;
    input expected_y;

    begin
      @(negedge clk);
      x = input_x;

      @(posedge clk);
      #1;

      if (y !== expected_y) begin
        $display("[%0t] FAILED: x=%b, y=%b, expected=%b", $time, x, y, expected_y);
        error_count = error_count + 1;
      end else begin
        $display("[%0t] PASSED: x=%b, y=%b", $time, x, y);
      end
    end
  endtask

  // 테스트
  initial begin
    clk         = 0;
    reset       = 1;
    x           = 0;
    error_count = 0;

    // Reset
    repeat (2) @(posedge clk);

    @(negedge clk);
    reset = 0;

    $display("[%0t] === Moore FSM 101 Test Start ===", $time);

    // --------------------------------------------------
    // "10101" 입력
    // "101"이 중첩되어 두 번 검출되어야 함
    // --------------------------------------------------

    apply_bit(1'b1, 1'b0);  // "1"
    apply_bit(1'b0, 1'b0);  // "10"
    apply_bit(1'b1, 1'b1);  // "101" 검출

    apply_bit(1'b0, 1'b0);  // "10" 상태 재사용
    apply_bit(1'b1, 1'b1);  // 두 번째 "101" 검출

    // --------------------------------------------------
    // 비검출 입력 확인
    // --------------------------------------------------

    apply_bit(1'b1, 1'b0);
    apply_bit(1'b0, 1'b0);
    apply_bit(1'b0, 1'b0);

    // --------------------------------------------------
    // 최종 결과
    // --------------------------------------------------

    if (error_count == 0) begin
      $display("[%0t] === ALL TESTS PASSED ===", $time);
    end else begin
      $display("[%0t] === TEST FAILED: %0d error(s) ===", $time, error_count);
    end

    #100;
    $finish;
  end

endmodule
