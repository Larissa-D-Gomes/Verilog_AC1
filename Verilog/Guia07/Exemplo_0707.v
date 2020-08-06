// ------------------------- 
// Exemplo_0707  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module maior(output s0, input a0, a1, b0, b1);

    assign s0 =(a0&~b1&~b0)|(~a0&a1&~b1)|(a0&a1&~b0)|(a1&b0&~b1);

endmodule

module menor(output s0, input a0, a1, b0, b1);

    assign s0 = (~a0&~a1&b0)|(~a0&b0&b1)|(~a1&~b0&b1)|(a0&~a1&b1);

endmodule

module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    

module COMPARADOR(output s0, input a0, a1, b0, b1, seletor);
    wire s1, s2;
    
      maior MAIOR1(s1,a0,a1,b0,b1);
      menor MENOR1(s2,a0,a1,b0,b1);
      MUX MUX1(s0,s1,s2,seletor);
    
endmodule
    
module ValoresIniciais;

reg [1:0] a, b;
reg seletor;
wire s0;

COMPARADOR COMP (s0, a[0], a[1], b[0], b[1], seletor);
initial
begin : start

	a = 2'bxx;
	b = 2'bxx;
	seletor = 1'bx;

end

initial
begin : main

	$display("Exemplo_0707 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 00; b = 00; seletor = 0;
	$display("seletor   a   b   =  s0  ");
    $monitor("%2B        %2b  %2b  = %2b ",seletor, a, b, s0);
		
    #1 a = 00; b = 01; seletor = 0;
    #1 a = 00; b = 10; seletor = 0;
    #1 a = 00; b = 11; seletor = 0;
    
    #1 a = 01; b = 00; seletor = 0;
    #1 a = 01; b = 01; seletor = 0;
    #1 a = 01; b = 10; seletor = 0;
    #1 a = 01; b = 11; seletor = 0;
    
    #1 a = 10; b = 00; seletor = 0;
    #1 a = 10; b = 01; seletor = 0;
    #1 a = 10; b = 10; seletor = 0;
    #1 a = 10; b = 11; seletor = 0;
    
    #1 a = 11; b = 00; seletor = 0;
    #1 a = 11; b = 01; seletor = 0;
    #1 a = 11; b = 10; seletor = 0;
    #1 a = 11; b = 11; seletor = 0;
    
	#1 a = 00; b = 00; seletor = 1;
    #1 a = 00; b = 01; seletor = 1;
    #1 a = 00; b = 10; seletor = 1;
    #1 a = 00; b = 11; seletor = 1;
        
    #1 a = 01; b = 00; seletor = 1;
    #1 a = 01; b = 01; seletor = 1;
    #1 a = 01; b = 10; seletor = 1;
    #1 a = 01; b = 11; seletor = 1;
    
    #1 a = 10; b = 00; seletor = 1;
    #1 a = 10; b = 01; seletor = 1;
    #1 a = 10; b = 10; seletor = 1;
    #1 a = 10; b = 11; seletor = 1;
    
    #1 a = 11; b = 00; seletor = 1;
    #1 a = 11; b = 01; seletor = 1;
    #1 a = 11; b = 10; seletor = 1;
    #1 a = 11; b = 11; seletor = 1;
    
end
endmodule