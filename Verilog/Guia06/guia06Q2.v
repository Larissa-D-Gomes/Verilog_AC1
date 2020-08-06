// ------------------------- 
// guia06Q2 - Simplificacao
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output a, input X, Y, Z);

	assign a = ( X| Y| Z)&(~X|~Y| Z)&(~X|~Y|~Z); 
  

endmodule



module AS (output as, input X, Y, Z);

	assign as = (X|Y|Z)&(~X|~Y);

endmodule

module B(output b, input X, Y, Z);
    
    assign b = (X|Y|~Z)&(~X|Y|~Z)&(~X|~Y|~Z);

endmodule

module BS(output bs, input X, Y, Z);

    assign bs = (Y|~Z)&(~X|~Z);

endmodule

module C(output c, input X, Y, Z);
    
    assign c = (X|Y|~Z)&(X|~Y|~Z)&(~X|Y|~Z)&(~X|~Y|~Z);

endmodule

module CS(output cs, input X, Y, Z);

    assign cs = (Y|~Z)&(~Y|~Z);

endmodule

module D(output d, input X, Y, Z);
    
    assign d = (X|Y|Z)&(X|Y|~Z)&(~X|Y|Z)&(~X|Y|~Z);

endmodule

module DS(output ds, input X, Y, Z);

    assign ds = (Y|Z)&(Y|~Z) ;

endmodule

module E(output e, input X, Y, Z);
    
    assign e = (X|Y|~Z)&(X|~Y|~Z)&(~X|Y|~Z)&(~X|~Y|Z) ;

endmodule

module ES(output es, input X, Y, Z);

    assign es = (X|~Z)&(Y|~Z)&(~X|~Y|Z);

endmodule

module ValoresIniciais;

reg x, y, z, w;
wire a, as, b, bs, c, cs, d, ds, e, es;

	A letraA (a, x, y, z);
	AS letraAS (as, x, y, z);
	B letraB (b, x, y, z);
    BS letraBS (bs, x, y, z);
    C letraC (c, x, y, z);
    CS letraCS (cs, x, y, z);
    D letraD (d, x, y, z);
    DS letraDS (ds, x, y, z);
    E letraE (e, x, y, z);
    ES letraES (es, x, y, z);

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
	
	#1 x = 0; y = 0; z = 0;
	$display(" x  y  z =  a  as   b  bs   c  cs   d  ds   e  es");
    $monitor("%2b %2b %2b = %2b %2b   %2b %2b   %2b %2b   %2b %2b   %2b %2b", x, y, z, a, as, b, bs, c, cs, d, ds, e, es);
		
	#1 x = 0; y = 0; z = 1;
	#1 x = 0; y = 1; z = 0;
	#1 x = 0; y = 1; z = 1;
	#1 x = 1; y = 0; z = 0;
	#1 x = 1; y = 0; z = 1;
	#1 x = 1; y = 1; z = 0;
	#1 x = 1; y = 1; z = 1;

end
endmodule