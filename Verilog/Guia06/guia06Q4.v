// ------------------------- 
// guia06Q4 - Simplificacao
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output a, input X,Y,W,Z);

	assign a = (X|Y|~W|Z)&(X|~Y|~W|Z)&(X|~Y|~W|~Z)&(~X|Y|~W|Z); 
  

endmodule



module AS (output as, input X, Y, W,Z);

	assign as = (Y|~W|Z)&(X|~Y|~W);

endmodule


module B (output b, input X,Y,W,Z);

	assign b = (X|~Y|W|Z)&(X|~Y|~W|~Z)&(~X|Y|W|~Z)&(~X|~Y|W|Z)&(~X|~Y|W|~Z); 
  

endmodule



module BS (output bs, input X, Y, W,Z);

	assign bs = (~Y|W|Z)&(~X|W|~Z)&(X|~Y|~W|~Z);

endmodule

module C (output c, input X,Y,W,Z);

	assign c =  (X|~Y|W|Z)&(~X|Y|W|Z)&(~X|~Y|W|~Z)&(~X|~Y|~W|Z)&(~X|~Y|~W|~Z); 
  

endmodule



module CS (output cs, input X, Y, W, Z);

	assign cs =(X|~Y|W|Z)&(~X|~Y|~Z)&(~X|~Y|~W)&(~X|Y|W|Z);

endmodule


module D (output d, input X,Y,W,Z);

	assign d = (X|Y|W|~Z)&(X|Y|~W|~Z)&(X|~Y|W|~Z)&(X|~Y|~W|~Z)&(~X|~Y|W|~Z)&(~X|~Y|~W|Z); 
  

endmodule


module DS (output ds, input X, Y, W,Z);

	assign ds = (X|~Z)&(~Y|W|~Z)&(~X|~Y|~W|Z);

endmodule

module E (output e, input X,Y,W,Z);

	assign e =(X|~Y|W|Z)&(X|~Y|W|~Z)&(X|~Y|~W|Z)&(X|~Y|~W|~Z)&(~X|~Y|~W|Z)&(~X|~Y|~W|~Z); 
  

endmodule


module ES (output es, input X, Y, W,Z);

	assign es = (X|~Y)&(~X|~Y|~W);

endmodule

module ValoresIniciais;

reg x, y, z, w;
wire a, as, b, bs, c, cs, d, ds, e, es;

	A letraA   (a, x, y, w, z);
	AS letraAS (as, x, y, w, z);
	B letraB   (b, x, y, w, z);
	BS letraBS (bs, x, y, w, z);
    C letraC   (c, x, y, w, z);
	CS letraCS (cs, x, y, w, z);
	D letraD   (d, x, y, w, z);
	DS letraDS (ds, x, y, w, z);
	E letraE   (e, x, y, w, z);
	ES letraES (es, x, y, w, z);
    
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
	$display(" x  y  w  z =  a   as    b   bs    c   cs    d   ds    e   es");
    $monitor("%2b %2b %2b %2b = %2b  %2b    %2b  %2b    %2b  %2b    %2b  %2b    %2b  %2b", x, y, w, z, a, as, b, bs, c, cs, d, ds, e, es);
		
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