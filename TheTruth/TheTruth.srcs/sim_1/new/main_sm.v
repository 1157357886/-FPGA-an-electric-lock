`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 22:07:49
// Design Name: 
// Module Name: main_bjq
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


module main_sm();
    reg clk,rs;
    reg [7:0]K;
    reg rkey;
    wire [1:0]les;
    wire [4:0]led;
    wire [7:0]dm1,dm2;
    wire [3:0]wm1,wm2;
    initial
    begin
    rkey=0;
    rs=0;
    K=0;
    clk=0;
    #20 K[1]=1;
    #20 K[5]=1;
    #20 K[3]=1;
    #20 K[7]=1;
    
    #500 rs=1;
    #20 K=0;
    #20 K[1]=1;
    #20 K[2]=1;
    #20 K[3]=1;
    #20 K[4]=1;
    end
    
    always
        #20 clk=~clk;

main u1(K,clk,led,les,rs,dm1,dm2,wm1,wm2,rkey);
endmodule
