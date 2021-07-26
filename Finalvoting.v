module Finalvoting(clock, mode, rest, bt1, bt2, b3, b4, out);
input clock, mode, reset, bt1, bt2, bt3, bt4;
output reg[7:0] out;                             // to get values of votes during counting mode

wire valid_vote_1;
wire valid_vote_2;
wire valid_vote_3;
wire valid_vote_4;
wire [7:0] candi1_vote_recvd;
wire [7:0] candi2_vote_recvd;
wire [7:0] candi3_vote_recvd;
wire [7:0] candi4_vote_recvd;

wire checking_valid_vote;
assign checking_valid_vote = valid_vote_1|valid_vote_2|valid_vote_3|valid_vote_4;

Button cand1(.clock(clock), .reset(reset), .button(bt1), .valid_vote(valid_vote_1));            // to instantiate candidates individual buttons
Button cand2(.clock(clock), .reset(reset), .button(bt2), .valid_vote(valid_vote_2));            
Button cand3(.clock(clock), .reset(reset), .button(bt3), .valid_vote(valid_vote_3));
Button cand4(.clock(clock), .reset(reset), .button(bt4), .valid_vote(valid_vote_4));

voteLogger Vl(.clock(clock), .reset(reset), .candi1_vote_valid(valid_vote_1), .candi2_vote_valid(valid_vote_2), .candi3_vote_valid(valid_vote_3), .candi4_vote_valid(valid_vote_4), 
            .candi1_vote_recvd(candi1_vote_recvd), .candi2_vote_recvd(candi2_vote_recvd), .candi3_vote_recvd(candi3_vote_recvd), .candi4_vote_recvd(candi4_vote_recvd));


mode control(.clock(clock), .reset(reset), .mode(mode), .casted_vote(checking_valid_vote), .candi1_votes(candi1_vote_recvd), .candi2_votes(candi2_vote_recvd), .candi3_votes(candi3_vote_recvd), .candi4_votes(candi4_vote_recvd), 
            .candi1_press(valid_vote_1), .candi2_press(valid_vote_2), .candi3_press(valid_vote_3), .candi4_press(valid_vote_4), .out(out));


endmodule
