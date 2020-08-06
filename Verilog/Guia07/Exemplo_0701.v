// ------------------------- 
// Exemplo_0701  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output s0, input x,y, seletor);

	and AND1 (s0, x, y);
	or  OR1 (s1, x, y);

endmodule


module ValoresIniciais;

reg a, b;
wire s0, s1;

A letraA   (s0, s1, a, b);
initial
begin : start

	a = 1'bx;
	b = 1'bx;

end

initial
begin : main

	$display("Exemplo_0701 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 0; b = 0; 
	$display(" a  b  =  s0   s1");
   $monitor("%2b %2b  = %2b   %2b", a, b, s0, s1);
		
	#1 a = 0; b = 0; 
	#1 a = 0; b = 1;
	#1 a = 1; b = 0; 
	#1 a = 1; b = 1; 

end
endmodule