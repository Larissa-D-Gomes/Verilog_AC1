// ------------------------- 
// Exemplo_0704  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output s0, s1, input x,y);
    or  OR1(s1, x, y);
	nor  NOR1 (s0, x, y);


endmodule

module B (output s0, s1, input x,y);
    
	xor XOR1(s1, x, y);
	xnor NXOR1 (s0, x, y);
	
endmodule

module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    

module E3(output s0, input x, y, seletor1, seletor2);

    wire ono1, ono2, xo1, xo2, m1, m2;
    
    A A1(ono1, ono2, x, y);
    B B1(xo1, xo2, x, y);
    MUX MUX1(m1, ono1, ono2, seletor1);
    MUX MUX2(m2, xo1, xo2, seletor1);
    MUX MUX3(s0, m2, m1, seletor2);
    
endmodule
    
module ValoresIniciais;

reg a, b;
reg [1:0] seletor;
wire s0;

E3 ME3 (s0, a, b, seletor[0], seletor[1]);
initial
begin : start

	a = 1'bx;
	b = 1'bx;
	seletor = 2'bxx;

end

initial
begin : main

	$display("Exemplo_0704 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 0; b = 0; seletor = 00;
	$display("seletor a  b  =  s0  ");
    $monitor("%2B      %2b %2b  = %2b ",seletor, a, b, s0);
		
	#1 a = 0; b = 1; seletor = 00;
	#1 a = 1; b = 0; seletor = 00;
	#1 a = 1; b = 1; seletor = 00;
	
	#1 a = 0; b = 0; seletor = 01;
	#1 a = 0; b = 1; seletor = 01;
	#1 a = 1; b = 0; seletor = 01;
	#1 a = 1; b = 1; seletor = 01;
	
	#1 a = 0; b = 0; seletor = 10;
	#1 a = 0; b = 1; seletor = 10;
	#1 a = 1; b = 0; seletor = 10;
	#1 a = 1; b = 1; seletor = 10;
	

	#1 a = 0; b = 0; seletor = 11;
	#1 a = 0; b = 1; seletor = 11;
	#1 a = 1; b = 0; seletor = 11;
	#1 a = 1; b = 1; seletor = 11;
end
endmodule