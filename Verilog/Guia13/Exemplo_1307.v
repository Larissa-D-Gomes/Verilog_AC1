// -------------------- 
// --- Deslocador de Bits--------- 
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

module deslocador(output [4:0] s, input clk, reset, x, input [4:0] r);
   wire[4:0]snot;
   wire i;
   jkff JK1( s[4], snot[4], ~s[4], s[4], clk, r[4], reset);
   jkff JK2( s[3], snot[3], s[0], ~s[0], clk, r[3], reset);
   jkff JK3( s[2], snot[2], s[1], ~s[1], clk, r[2], reset);
   jkff JK4( s[1], snot[1], s[2], ~s[2], clk, r[1], reset);
   jkff JK5( s[0], snot[0], s[3], ~s[3], clk, r[0], reset);


endmodule

module loadE(output [4:0] s, input load, input [4:0] x);
    wire[4:0] s;
    assign s[0] = load & x[0];
    assign s[1] = load & x[1];
    assign s[2] = load & x[2];
    assign s[3] = load & x[3];
    assign s[4] = load & x[4];
endmodule

module exemplo1307;  
   reg   clk, reset, load;
   reg   x;  
   reg[4:0] l;
   wire[4:0] i, s;
   
   loadE L1(i, load, l);
   deslocador D1(s, clk, reset, x, i);
 
   initial   
      begin    
      $display ( "Deslocador de Bits" ); 
      $display ( "Exemplo1305 - Larissa Domingues Gomes - 650525" );
      $display ( "time  out" );
 
   // initial values        
      clk   = 1;        
      reset = 1;       
      x     = 0; 

   // input signal changing   
   // input signal changing   
      #10 reset = 0;  l = 5'b01010;
      #15 load = 1;
      #5 load = 0;
      #40 reset = 1;
      #5 reset = 0;  l = 5'b00010;
      #5 load = 1;
      #10 load = 0; 
      #40 $finish;
      end // initial 
 
   always   
      #5 clk = ~clk; 
 
   always @( negedge clk )   
      begin    
         $display ( "%4d %4b %4b", $time, s, i);   
      end // always at positive edge clocking changing 
 
endmodule // Exemplo_1307  
