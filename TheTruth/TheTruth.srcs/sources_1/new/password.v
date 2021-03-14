`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/10 17:41:37
// Design Name: 
// Module Name: IF_CD4017_5
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
module password(K,s,ledtemp,les,rs,code);
    input [7:0]K;
    input [7:0]code;
    input [4:0]ledtemp;
    input rs;
    output s;
    output [1:0]les;
    reg s=1'b0;
    reg [1:0]lestemp=2'b00;
    assign les=lestemp;
   
   always @(posedge K[0] or posedge K[1] or posedge K[2] or posedge K[3] or posedge K[4] or posedge K[5] or posedge K[6] or posedge K[7] or negedge rs )
    begin
        if(rs==0)
           begin
            lestemp=2'b00;
           end
      begin
        if(K[0]|| K[1] || K[2] || K[3] || K[4] || K[5] || K[6] || K[7])
        begin
        if(lestemp==2'b00)
           lestemp=2'b11;
        if(lestemp==2'b00)
           lestemp=2'b11;
        else if(lestemp==2'b01||lestemp==2'b10)
            s=0;
        else
                 s=1;
         if(ledtemp==5'b00000)
            begin
                s=0;
                lestemp=2'b01;
             end
         if((code==K)&&lestemp==2'b11)
                begin
                    s=0;
                    lestemp=2'b10;
                end
        end
      end
     
   end  
endmodule