`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 21:51:53
// Design Name: 
// Module Name: clock_bjq
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


module clock_status_sm();
    reg s,clk;
    reg RS;
    wire [4:0]led;
    wire f;                       
    wire [3:0]t1;
    
    initial
    begin
        s=0;
        clk=0;
        RS=0;
        #20 RS=1;
        s=1;
    end
    always
        #20 clk=~clk;        
clock_status u1(s,clk,RS,led,f,t1);
endmodule
