`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/11 15:55:35
// Design Name: 
// Module Name: Clock
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


module clock_status(s,clk,RS,led,f,t1);
    input s,clk;
    input RS;
    output [4:0]led;
    output reg f=0;                        //5s�����ı�־
    output reg [3:0]t1=4'b0000;          //��ʾʱ�������
    reg [4:0] ledtemp = 5'b11111;      // led��ֵ
    reg [31:0] div_cnt = 0;            // 32λ����������Ƶ��
    reg [31:0] div_cntms = 0;            // 32λ����������Ƶ��
    reg divclk = 1;
     reg divclkms= 1;
    assign led = ledtemp;
    
    always @(posedge clk )
    if(s)                          //s=1����ʼ��ʱ��������
        begin
        
           if(div_cnt  == 70000000)  
                  begin
                       divclk  = ~divclk;
                       div_cnt = 0;
                  end
          else    
                    begin 
                       div_cnt = div_cnt +1'b1;        
                   end
          end
      always @(posedge divclk or negedge RS )           //ÿ��1sdivclk������������
      begin
      if(s)
      begin
          ledtemp = ledtemp << 1;        //����1λ
          t1 = t1+1'b1;                   //t1ÿ�μ�1
          if(ledtemp==5'b00000)           //5s�󣬱�־f=1
                f=1'b1;
          else
                f=1'b0;
        end
          if(RS==0)
          begin
           ledtemp=5'b11111;   //rs����Ļ���ʱ�ӹ�λ��������һ��������s��Ϊ��
            f=1'b0;
            t1=4'b0000;
        end
      end
 

endmodule
