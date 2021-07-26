module voteLogger(clock, reset, candi1_vote_valid, candi2_vote_valid, candi3_vote_valid, candi4_vote_valid, candi1_vote_recvd, candi2_vote_recvd, candi3_vote_recvd, candi4_vote_recvd);
input clock, reset, candi1_vote_valid, candi2_vote_valid, candi3_vote_valid, candi4_vote_valid;
output reg [7:0] candi1_vote_recvd;
output reg [7:0] candi2_vote_recvd;
output reg [7:0] candi3_vote_recvd;
output reg [7:0] candi4_vote_recvd;

always @(posedge clock)
begin
  if(reset)
  begin
    candi1_vote_recvd <=0;
    candi2_vote_recvd <=0;
    candi3_vote_recvd <=0;
    candi4_vote_recvd <=0;
end
else
begin
  if(candi1_vote_valid & mode == 0)
    candi1_vote_recvd <= candi1_vote_recvd + 1;
  else if(candi2_vote_valid & mode == 0)
    candi2_vote_recvd <= candi2_vote_recvd + 1;
  else if(candi3_vote_valid & mode == 0)                        // in case of physical system you can press 2 keys so this is for priority
    candi3_vote_recvd <= candi3_vote_recvd + 1;     // but in test bench we will take care of not giving 2 high at same time
  else if(candi4_vote_valid & mode == 0)
    candi4_vote_recvd <= candi4_vote_recvd + 1;
end 
end

endmodule