// ------------------------- 
// Guia06Q6 - Simplificacao
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output a, input X,Y,W,Z);

   assign a = (~(~X|~Y|W)&~(X&Y&~W))|~((Y&W&Z)|~X);
  

endmodule



module AS (output as, input X, Y, W,Z);

	assign as = (X|Y)&(X|~Y)&(~Y|~W|~Z);

endmodule



module ValoresIniciais;

reg x, y, z, w;
wire a, as;

	A letraA   (a, x, y, w, z);
	AS letraAS (as, x, y, w, z);

    
initial
begin : start

	x = 1'bx;
	y = 1'bx;
	z = 1'bx;
	w = 1'bx;

end

initial
begin : main

	$display("Exemplo - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 x = 0; y = 0; w = 0; z = 0;
	$display(" x  y  w  z =  a   as");
    $monitor("%2b %2b %2b %2b = %2b  %2b", x, y, w, z, a, as);
		
	#1 x = 0; y = 0; w = 0; z = 0;
	#1 x = 0; y = 0; w = 0; z = 1;
	#1 x = 0; y = 0; w = 1; z = 0;
	#1 x = 0; y = 0; w = 1; z = 1;
    #1 x = 0; y = 1; w = 0; z = 0;
	#1 x = 0; y = 1; w = 0; z = 1;
	#1 x = 0; y = 1; w = 1; z = 0;
	#1 x = 0; y = 1; w = 1; z = 1;
	#1 x = 1; y = 0; w = 0; z = 0;
	#1 x = 1; y = 0; w = 0; z = 1;
	#1 x = 1; y = 0; w = 1; z = 0;
	#1 x = 1; y = 0; w = 1; z = 1;
	#1 x = 1; y = 1; w = 0; z = 0;
	#1 x = 1; y = 1; w = 0; z = 1;
	#1 x = 1; y = 1; w = 1; z = 0; 
	#1 x = 1; y = 1; w = 1; z = 1;
	
		

end
endmodule
