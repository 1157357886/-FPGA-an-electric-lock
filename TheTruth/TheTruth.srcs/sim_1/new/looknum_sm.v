`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 23:35:11
// Design Name: 
// Module Name: looknum_sm
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


module looknum_sm();
    reg clk;
    reg [3:0] sw1,sw2,sw3,sw4; 
    wire [7:0] dm1;
    wire [3:0] wm1;
    
    initial
    begin
        clk=0;
        sw1=4'b0001;
        sw2=4'b0001;
        sw3=4'b0001;
        sw4=4'b0001;
    end
    
    always
        #20 clk=~clk;

looknum u1(clk, sw1, sw2,sw3,sw4,dm1, wm1);
endmodule
