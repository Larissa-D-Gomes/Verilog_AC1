// -------------------- 
// ----Moore----FSM 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------- 
// 

// FSM by Moore module  
module moore_1103 ( y, x, clk, reset );  
   output y;  
   input  x;  
   input  clk;  
   input  reset; 
 
   reg    y; 
 
   parameter        // state identifiers 
      start  = 3'b000,    
      id1    = 3'b001,    
      id10   = 3'b010,    
      id010  = 3'b011,  
      id1010 = 3'b111;    //  signal found  
      
      reg [2:0] E1; // current state variables    
      reg [2:0] E2; // next state logic output 
 
      // next state logic    
         always @( x or E1 )     
         begin      
            case( E1 ) 
            start:         
               if ( x )          
                  E2 = start;         
               else     
                  E2 = id1;            
             id1:        
               if ( x )          
                  E2 = id10;        
               else          
                  E2 = id1;       
              id10: 
                if ( x )          
                  E2 = id1;         
                else          
                  E2 = id010; 
              id010: 
                if ( x )          
                  E2 = id1010;         
                else          
                  E2 = id1;              
              id1010:         
                if ( x )          
                  E2 = id1;         
                else          
                  E2 = id010;      
              default:   // undefined statee            
               E2 = 3'bxxx;      
   endcase     
end // always at signal or state changing 

// state variables    
   always @( posedge clk or negedge reset )     
      begin      
         if ( reset )       
            E1 = E2;    // updates current state      
         else       
            E1 = 0;     // reset     
       end // always at signal changing 
 
// output logic    
   always @( E1 )     
      begin      
         y = E1[2];   // first bit of state value (MOORE indicator)     
      end // always at state changing 
 
endmodule // moore_1103


 
module exemplo1103;  
   reg   clk, reset, x;  
   wire  m2;

   moore_1103 moore1 ( m2, x, clk, reset ); 
 
   initial   
      begin    
      $display ( "Time     X   Moore" ); 
      $display ( "Exemplo1103 - Larissa Domingues Gomes - 650525" );
      $dumpfile ( "Exemplo_1103.vcd" );   
      $dumpvars ( 1, clk, x, m2 );
 
   // initial values        
      clk   = 1;        
      reset = 0;        
      x     = 0; 
   // input signal changing   
      #5  reset = 1;   
      #10 x     = 0;   
      #10 x     = 1;   
      #10 x     = 0;   
      #10 x     = 1;   
      #10 x     = 0;   
      #10 x     = 1;   
      #10 x     = 0;   
      #10 x     = 1; 
 
      #30 $finish;  
      end // initial 
 
   always   
      #5 clk = ~clk; 
 
   always @( posedge clk )   
      begin    
         $display ( "%4d  %4b %4b", $time, x, m2 );   
      end // always at positive edge clocking changing 
 
endmodule // Exemplo_1103 