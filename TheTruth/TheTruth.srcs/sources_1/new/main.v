`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/14 15:15:35
// Design Name: 
// Module Name: main
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


module main(K,clk,led,les,rs,dm1,dm2,wm1,wm2,rkey);
    input clk,rs;
    input [7:0]K;
    input rkey;
    output [1:0]les;
    output [4:0]led;
    output [7:0]dm1,dm2;//显示输入数字和输入次数的函数的位数输出和段输出
    output [3:0]wm1,wm2;//显示输入数字和输入次数的函数的位数输出和段输出
    wire s;
    wire [3:0]t1;
    wire [4:0]led;
    reg[3:0] num1,num2,num3,num4,count;//用于记录读数
    reg [7:0]code=8'b01111000;
    initial
        begin
            num1=4'b1111;
            num2=4'b1111;
            num3=4'b1111;
            num4=4'b1111;
        end
    always@(K or rs or rkey)
    begin
          begin
            num4={1'b0,1'b0,K[0],K[1]};
              num3={1'b0,1'b0,K[2],K[3]};
                num2={1'b0,1'b0,K[4],K[5]};
                  num1={1'b0,1'b0,K[6],K[7]};
                     count=K[0]+K[1]+K[2]+K[3]+K[4]+K[5]+K[6]+K[7];
                end
         if(rs==1)//删除
                    begin     //开始右移
                        num1=4'b1111;
                        num2=4'b1111;
                        num3=4'b1111;
                        num4=4'b1111;
                        count=0;
                  end
          if(rkey==1)
               if(les==2'b10)
                 code=K;
        end
   looknum u4(clk, num1, num2,num3,num4,dm2, wm2);
   lookcount u3(clk,t1,les,count,dm1, wm1,~rs);
   clock_status u1(s,clk,~rs,led,f,t1);
   password u2(K,s,led,les,~rs,code);
endmodule
