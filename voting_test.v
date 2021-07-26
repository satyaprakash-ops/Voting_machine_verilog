module voting_test;
reg clock, reset, button;
wire valid_vote;

Button vot(clock, reset, button, valid_vote);

initial begin
    clock=1'b0;
end

always begin
    #5 clock=~clock;
end

initial begin
    $monitor($time, " reset=%b, button=%b, valid_vote= %b", reset, button, valid_vote);
    #5 reset=1'b0; button=1'b1;
    #5 reset=1'b0; button=1'b1;
    #5 $finish;
end
endmodule