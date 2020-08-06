// ------------------------- 
// Guia06Q5 - Simplificacao
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output a, input x,y,z);

	assign a = (~(~x|~y) & ~(x&y)) | ~((y&z)|~x); 
  

endmodule



module AS (output as, input x, y, z);

	assign as = (x&~y)|(x&~z);

endmodule


module ValoresIniciais;

reg x, y, z, w;
wire a, as;

	A letraA (a, x, y, z);
	AS letraAS (as, x, y, z);


initial
begin : start

	x = 1'bx;
	y = 1'bx;
	z = 1'bx;
	w = 1'bx;

end

initial
begin : main

	$display("Exemplo - Larissa Gomes - 65052");
	$display("Expressoes booleanas");
	
	#1 x = 0; y = 0; z = 0;
	$display(" x  y  z =  a  as");
    $monitor("%2b %2b %2b = %2b %2b", x, y, z, a, as);
		
	#1 x = 0; y = 0; z = 1;
	#1 x = 0; y = 1; z = 0;
	#1 x = 0; y = 1; z = 1;
	#1 x = 1; y = 0; z = 0;
	#1 x = 1; y = 0; z = 1;
	#1 x = 1; y = 1; z = 0;
	#1 x = 1; y = 1; z = 1;

end
endmodule