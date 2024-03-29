module Reset_Delay
    (
        input iCLK,
        output oRESET
    );

    reg oRESET;
    reg[19:0] Cont;

    always @(posedge iCLK)
        begin
            if (Cont != 20'hFFFFF)
                begin
                    Cont <= Cont+1;
                    oRESET <= 1'b0;
                end
            else
                oRESET <= 1'b1;
        end

endmodule // Reset_Delay
