// --------------------------- 
//-- 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------------
 
module clock1 ( output clk ); 
    reg clk; 
 
 initial   
    begin    
        clk = 1'b0;   
    end 
 
 always   
    begin    
        #12 clk = ~clk;//Altercacao pulso clock 12 unidades de tempo
    end 
 
endmodule // clock1 ( ) 
 
module clock2 ( output clk ); 
    reg clk; 
 
 initial   
    begin    
       clk = 1'b0;   
    end 
 
 always   
    begin    
        #4 clk = ~clk;//Altercacao pulso clock 30 unidades de tempo  
    end 
 
endmodule // clock2 ( ) 
 
 
 
 
 

 module P2Q4; 
 
    wire  clk, clk2;  
    clock1 CLK1 ( clk ); 
    clock2 CLK2 ( clk2 );
 
 initial 
    begin   
        $display("Larissa Domingues Gomes - 650525");    
        $dumpfile ( "P2Q4.vcd" );   
        $dumpvars; 
 
     #120 $finish;  end 
 
endmodule

//Clk apresentou pulsos mais longos, enquanto o
//clk2 apresentou pulsos com mais longa duracao
//ambos conforme unidades de tempo definidas