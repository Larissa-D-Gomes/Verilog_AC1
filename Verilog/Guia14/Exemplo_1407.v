// -------------------- 
// ---Twisted Ring Counter--------- 
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

module deslocador(output [4:0] s, input clk, reset, x);
   wire[4:0]snot;
   wire i;
   or OR1(i , ~s[0], x);
   jkff JK1( s[4], snot[4], i, ~i, clk, 1'b0, reset);
   jkff JK2( s[3], snot[3], s[4], ~s[4], clk, 1'b0, reset);
   jkff JK3( s[2], snot[2], s[3], ~s[3], clk, 1'b0, reset);
   jkff JK4( s[1], snot[1], s[2], ~s[2], clk, 1'b0, reset);
   jkff JK5( s[0], snot[0], s[1], ~s[1], clk, 1'b0, reset);

endmodule

module exemplo1407;  
   reg   clk, reset;
   reg   x;  
   wire[4:0]  s;
   
   deslocador D1(s, clk, reset, x);
 
   initial   
      begin    
      $display ( "Twisted Ring Counter" ); 
      $display ( "Exemplo1407 - Larissa Domingues Gomes - 650525" );
      $display ( "time   in    out" );
 
   // initial values        
      clk   = 1;        
      reset = 1;       
      x     = 0; 
   // input signal changing   
      #5 reset = 0;   
      #10 x     = 1; 
      #10 x     = 1;  
      #10 x     = 0; 
      #10 x     = 0;  
      #10 x     = 0;  
      #10 x     = 0; 
      #10 x     = 1;  
      #10 $finish;  
      end // initial 
 
   always   
      #5 clk = ~clk; 
 
   always @( negedge clk )   
      begin    
         $display ( "%4d  %4b  %4b ", $time, x, s);   
      end // always at positive edge clocking changing 
 
endmodule // Exemplo_1407 