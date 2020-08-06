// --------------------------- 
//-- test clock generator (8) 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------------
 
 `include "clock.v" 
module pulse1 ( signal, clock );  
   input   clock;  
   output signal;  
   reg    signal; 
   
    always @ ( clock )   
    begin         
         signal = 1'b1;
      #4 signal = 1'b0;
      #4 signal = 1'b1;
      
      end 
endmodule // pulse 


module Exemplo_0907; 
 
   wire  clock;  
   clock clk ( clock ); 
 
   wire  p1; 
 
   pulse1   pls1   ( p1, clock );  
 
   initial 
   begin   
      $display("Exemplo0908 - Larissa Domingues Gomes - 650525");
      $dumpfile ( "Exemplo0908.vcd" );   
      $dumpvars ( 1, clock, p1); 
 
      #480 $finish;  
   end 
   
 endmodule // Exemplo_0908