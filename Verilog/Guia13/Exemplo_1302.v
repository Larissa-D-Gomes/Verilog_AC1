// -------------------- 
// --- Deslocador de bits 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------- 
// 

module jkff ( output q, output qnot, input j, input k, input clk, input preset, input clear); 
  reg    q, qnot; 

   always @( posedge clk  or preset or clear ) 
   begin   
      if ( clear )      
      begin 
         q <= 0; 
         qnot <= 1; 
      end   
      else     
         if ( preset )  
         begin 
            q <= 1; qnot <= 0;
         end     
         else       
            if ( j & ~k ) 
            begin 
               q <= 1; 
               qnot <= 0; 
            end       
            else        
               if ( ~j & k )
               begin 
                  q <= 0; 
                  qnot <= 1; 
               end        
               else         
                  if ( j & k )                 
                  begin 
                     q <= ~q; 
                     qnot <= ~qnot; 
                   end 
end 
 
endmodule // jkff 

module deslocador(output [4:0] s, input clk, reset, input [4:0] i);
   wire[4:0]snot;
   jkff JK1( s[0], snot[0], 1'b0,  1'b1, clk, i[0], reset);
   jkff JK2( s[1], snot[1], s[0], ~s[0], clk, i[1], reset);
   jkff JK3( s[2], snot[2], s[1], ~s[1], clk, i[2], reset);
   jkff JK4( s[3], snot[3], s[2], ~s[2], clk, i[3], reset);
   jkff JK5( s[4], snot[4], s[3], ~s[3], clk, i[4], reset);

endmodule

module load(output[4:0] s,input load, clk , input[4:0] x);
    wire[4:0]i;
    and AND1(i[0], load, x[0]);
    and AND2(i[1], load, x[1]);
    and AND3(i[2], load, x[2]);
    and AND4(i[3], load, x[3]);
    and AND4(i[4], load, x[4]);
    deslocador D1(s, clk, reset, i);
    
endmodule

module exemplo1302;  
   reg   clk, reset, load;
   reg[4:0]   x;  
   wire[4:0]  s;
   
   load L1(s, load, clk, x);
 
   initial   
      begin    
      $display ( "Deslocador de Bits" ); 
      $display ( "Exemplo1302 - Larissa Domingues Gomes - 650525" );
      $display ( "time   in    out" );
   // initial values        
      clk   = 1;        
      reset = 1;       
      x     = 0; 
   // input signal changing 
      #5 reset = 0; 
      load = 1; 
      x     =  5'b11110;  
      #5  load = 1;
      #10 load = 0;
      #50 x     =  5'b10010;  
      #10 load = 1;
      #10 load = 0;
      #60 $finish;  
      end // initial 
 
   always   
      #5 clk = ~clk; 
 
   always @( negedge clk )   
      begin    
         $display ( "%4d  %4b  %4b %4b", $time, x, s, load);   
      end // always at positive edge clocking changing 
 
endmodule // Exemplo_1302  