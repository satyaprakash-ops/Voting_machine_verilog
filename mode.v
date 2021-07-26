module mode(clock, reset, mode, casted_vote, candi1_votes, candi2_votes, candi3_votes, candi4_votes, candi1_press, candi2_press, candi3_press, candi4_press, out);
input clock, reset, mode, casted_vote, candi1_press, candi2_press, candi3_press, candi4_press,;
input [7:0] candi1_votes;
input [7:0] candi2_votes;
input [7:0] candi3_votes;
input [7:0] candi4_votes; 

output [7:0] out;

            // maybe i will require to check timing for valid vote     if yes then see right below and make changes    maybe a counter required

always @(posedge clock)
begin
  if(reset)
    out <= 0;
  else
  begin
    if(mode == 0 & casted_vote)
        out <= 8'hFF;
    else if(mode == 0)
        out <= 8'h00;
    else if(mode == 1)
    begin
      if(candi1_press)
        out<= candi1_votes;
      else if(candi2_press)
        out<= candi2_votes;
      else if(candi3_press)
        out<= candi3_votes;
      else if(candi4_press)
        out<= candi4_votes;
    end
  end
end 