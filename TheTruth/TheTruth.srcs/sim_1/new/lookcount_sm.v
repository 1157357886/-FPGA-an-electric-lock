`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 23:21:45
// Design Name: 
// Module Name: lookcount_sm
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


module lookcount_sm();
    reg clk;
    reg rs;
    reg [1:0]les;
    reg [3:0] t1,count;
    wire [7:0] dm1;
    wire [3:0] wm1;
    
    initial
    begin
        clk=0;
        rs=1;
        les=2'b01;
        t1=4'b0001;
        count=4'b0001;
    end

     always
        #20 clk=~clk;

lookcount u1(clk,t1,les,count,dm1, wm1,rs);
endmodule
