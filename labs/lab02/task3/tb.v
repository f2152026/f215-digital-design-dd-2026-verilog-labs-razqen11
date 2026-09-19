module tb;

    reg [1:0] t_A, t_B;
    wire t_GT, t_LT, t_EQ;

    comp2 U1 (
        .A(t_A),
        .B(t_B),
        .GT(t_GT),
        .LT(t_LT),
        .EQ(t_EQ)
    );

    integer a, b;

    initial begin
        for (a = 0; a < 4; a = a + 1) begin
            for (b = 0; b < 4; b = b + 1) begin
                t_A = a;
                t_B = b;

                #1;

                if ((t_GT !== (t_A > t_B)) ||
                    (t_LT !== (t_A < t_B)) ||
                    (t_EQ !== (t_A == t_B))) begin

                    $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
                             t_A, t_B, t_GT, t_LT, t_EQ);
                end
            end
        end

        $finish;
    end

endmodule