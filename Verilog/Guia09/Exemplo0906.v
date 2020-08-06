// --------------------------- 
//-- test clock generator (6) 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------------
 
 `include "clock.v" 
module pulse1 ( signal, clock );  
   input   clock;  
   output signal;  
   reg    signal; 
   
    always @ ( posedge clock )   
    begin         
         signal = 1'b1;
      #2 signal = 1'b0;
      #2 signal = 1'b1;
      #2 signal = 1'b0;
      #2 signal = 1'b1;
      #2 signal = 1'b0;  
      
      end 
endmodule // pulse 


module Exemplo_0906; 
 
   wire  clock;  
   clock clk ( clock ); 
 
   wire  p1; 
 
   pulse1   pls1   ( p1, clock );  
 
   initial 
   begin   
      $display("Exemplo0906 - Larissa Domingues Gomes - 650525");
      $dumpfile ( "Exemplo0906.vcd" );   
      $dumpvars ( 1, clock, p1); 
 
      #480 $finish;  
   end 
   
 endmodule // Exemplo_0906