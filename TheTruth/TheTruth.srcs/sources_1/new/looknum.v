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


module looknum(clk, sw1, sw2,sw3,sw4,dm1, wm1);
   input clk;
   input [3:0] sw1,sw2,sw3,sw4; 
   output [7:0] dm1;
   output [3:0] wm1;
   
   reg [7:0] dm1 = 0;  
   reg [3:0] wm1 = 4'b0001; 
   reg [14:0] div_cnt = 0; 
   reg divclk = 0;
   reg [3:0] disp_dat = 0; 
   reg [1:0] disp_bit = 0;

   parameter  maxcnt=25000;//仿真时候为了方便改为10

   always @(posedge clk )
   begin
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
                         disp_dat = sw1;
                         wm1 = 4'b0001;   
                   end
             2'b01:
                   begin
                         disp_dat = sw2;
                         wm1 = 4'b0010; 
                   end
             2'b10:
                   begin
                         disp_dat = sw3;
                         wm1 = 4'b0100; 
                   end
            2'b11:
                   begin
                         disp_dat = sw4;
                         wm1 = 4'b1000; 
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
            4'b1001: dm1 = 8'hf6;
            4'b1010: dm1 = 8'hee;
            4'b1011: dm1 = 8'hfe;
            4'b1100: dm1 = 8'h9c;
            4'b1101: dm1 = 8'hEF;//字符R
            4'b1110: dm1 = 8'h9E;//字符E
            4'b1111: dm1 = 8'h01;//小数点
            default: dm1 = 8'h01;  
        endcase
      end
    
endmodule


