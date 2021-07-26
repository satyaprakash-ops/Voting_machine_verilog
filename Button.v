module Button(clock, reset, button, valid_vote);
input clock, reset, button;
output reg valid_vote;

reg [31:0] counter;

// for testbench i am giving 5 as time instead of 1 sec

always @(posedge clock)
begin
  if(reset)
    counter <=0;
  else
  begin
    if(button & counter < 2)
        counter <= counter +1;
    else if(!button)
        counter <=0;
  end
end

always @(posedge clock)
begin
  if(reset)
    valid_vote <= 1'b0;
  else
  begin
    if(counter == 1)
        valid_vote <= 1'b1;
    else
        valid_vote <=1'b0;
  end
end

endmodule