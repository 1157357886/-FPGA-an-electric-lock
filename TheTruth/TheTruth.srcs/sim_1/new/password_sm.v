`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 23:34:06
// Design Name: 
// Module Name: password_sm
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


module password_sm();
    reg [7:0]K;
    reg [7:0]code;
    reg [4:0]ledtemp;
    reg rs;
    wire s;
    wire [1:0]les;
    
    initial
    begin
        code=8'b01111000;
        K=0;
        ledtemp=5'b11111;
        rs=0;
        #20 rs=1;
        #50 K[1]=1;
        #50 K[2]=1;
        #50 K[3]=1;
        #50 K[4]=1;
        #50 ledtemp=5'b00000;
         rs=0;
         K=0;
          ledtemp=5'b11111;
        #20 rs=1;
        #50 K[1]=1;
        #50 K[2]=1;
        #50 K[3]=1;
        #50 K[4]=1;
        #50 ledtemp=5'b00000;
    end


password u1(K,s,ledtemp,les,rs,code);
endmodule
