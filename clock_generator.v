`include "shifts.v"
module clock_generator (wb_clk_in,
			wb_rst,
			go,
			tip,
			last_clk,
			divider,
			sclk_out,
			cpol_0,
			cpol_1);

input   wb_clk_in,
	wb_rst,
	tip, 
	go,
	last_clk;

input [`SPI_DIVIDER_LEN-1:0]divider;

output  sclk_out,
	cpol_0,
	cpol_1;

reg     sclk_out,
	cpol_0,
	cpol_1;  //reg type because we want them to hold the value until the next clockpulse

reg [`SPI_DIVIDER_LEN-1:0] cnt; //counter to calculate the divider value (internal variable)

//let us first write the counter which asesses the divider
always@(posedge wb_clk_in or posedge wb_rst) //always blocks run concurrently
 begin
  if(wb_rst)
   begin
    cnt<={{`SPI_DIVIDER_LEN{1'b0}},1'b1};
   end
  else if(tip)
   begin
    if(cnt==(divider+1))
	begin
        cnt<={{`SPI_DIVIDER_LEN{1'b0}},1'b1};
	end
    else
	begin
        cnt<= cnt+1;
	end
   end
    else if(cnt==0)
	begin
	cnt<={{`SPI_DIVIDER_LEN{1'b0}},1'b1};
	end
 end

//now we write the serial clock generator
always@(posedge wb_clk_in or posedge wb_rst)
 begin
  if(wb_rst)
   begin
    sclk_out<= 1'b0;
   end
  else if (tip)
   begin
     if(cnt==(divider+1))
      begin
       if(!last_clk || sclk_out)
        begin
          sclk_out<=~sclk_out;
        end
      end
   end
 end

//cpol0 and cpol1 detection ie rising and faliing edge detections

always@(posedge wb_clk_in or posedge wb_rst)
 begin
  if(wb_rst)
   begin
    cpol_0<=1'b0;
    cpol_1<=1'b0;
   end
 else
  begin
	cpol_0<=0;
	cpol_1<=0;
    if(tip)
     begin
      if(~sclk_out)
        begin
         if(cnt==divider)
		begin
		cpol_0<=1;
		end
        end
     end
    if(tip)
     begin
      if(sclk_out)
       begin
	 if(cnt==divider)
		begin
		cpol_1<=1;
		end
       end
     end
 end
end

endmodule
