`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/11 15:43:00
// Design Name: 
// Module Name: lookcount
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


module lookcount(clk,t1,les,count,dm1, wm1,rs);
   input clk;
   input rs;
   input [1:0]les;
   input [3:0] t1,count;
   output [7:0] dm1;
   output [3:0] wm1;
   reg [7:0] dm1 = 0;  
   reg [3:0] wm1 = 4'b0001; 
   reg [14:0] div_cnt = 0; 
   reg divclk = 0;
   reg [3:0] disp_dat = 0; 
   reg [1:0] disp_bit = 0;
   reg [3:0]status;
   parameter  maxcnt=25000;//方便起见以10为仿真时候的值

   always @(posedge clk )
   begin
      if(rs==0)
          status=0;
      else if(les==2'b11)
         status=4'b1111;
      else if(les==2'b10)
         status=4'b1110;
       else if(les==2'b01)
          status=4'b1101;
       if(div_cnt  == maxcnt)  
              begin
                   divclk  = ~divclk;
                   div_cnt = 0;
              end
      else    
                begin 
                   div_cnt = div_cnt +1'b1;     
               end
      end
       always @(posedge divclk )
       begin            
          if ( disp_bit >= 3) 
                      disp_bit = 0; 
          else
                     disp_bit = disp_bit + 1;    

          case (disp_bit)
              2'b00:
                   begin
                         disp_dat = t1;
                         wm1 = 4'b1000;   
                   end
             2'b01:
                   begin
                         disp_dat = status;
                         wm1 = 4'b0001; 
                   end
              2'b10:
                   begin
                         disp_dat =count;
                         wm1 = 4'b0010;   
                   end
              2'b11:
                   begin
                         disp_dat = 4'b1011;
                         wm1 = 4'b0100;   
                   end
             default:
                   begin
                         disp_dat = 0 ;
                         wm1 = 4'b0000; 
                   end
           endcase
       end
       always @(disp_dat)
       begin            
         case (disp_dat)
            4'b0000: dm1 = 8'hfc;
            4'b0001: dm1 = 8'h60;
            4'b0010: dm1 = 8'hda;
            4'b0011: dm1 = 8'hf2;
            4'b0100: dm1 = 8'h66;
            4'b0101: dm1 = 8'hb6;
            4'b0110: dm1 = 8'hbe;
            4'b0111: dm1 = 8'he0;
            4'b1000: dm1 = 8'hfe;
            4'b1001: dm1 = 8'h01;//表示小数点
            4'b1111: dm1 = 8'b00011100;//正在输入
            4'b1101: dm1 = 8'h8e;//失败
            4'b1110: dm1 =8'b10011100;//成功
            4'b1011: dm1=8'b10110110;
            default: dm1 = 8'hfc;  
        endcase
      end
    
endmodule


