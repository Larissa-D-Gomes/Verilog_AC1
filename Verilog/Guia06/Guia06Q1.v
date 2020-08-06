// ------------------------- 
// Guia06Q1 - Simplificacao
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output a, input x,y,z);

	assign a = (~x&~y&z)|(~x&y&z)|(x&~y&z); 
  

endmodule



module AS (output as, input x, y, z);

	assign as = (~y&z)|(~x&z);

endmodule

module B(output b, input x, y, z);
    
    assign b = (~x&~y&~z)|(x&~y&~z)|(x&y&~z);

endmodule

module BS(output bs, input x, y, z);

    assign bs = (~y&~z)|(x&~z);

endmodule

module C(output c, input x, y, z);
    
    assign c = (~x&~y& z)|(~x& y&~z)|( x&~y& z)|( x& y&~z);

endmodule

module CS(output cs, input x, y, z);

    assign cs = (~y&z)|(y&~z);

endmodule

module D(output d, input x, y, z);
    
    assign d = (~x&~y&z)|(~x&y&z)|(x&~y&z)|(x&y&z);

endmodule

module DS(output ds, input x, y, z);

    assign ds = (~y&z)|(y&z);

endmodule

module E(output e, input x, y, z);
    
    assign e = (~x&~y&~z)|(~x&y&~z)|(x&~y&~z)|(x&~y&z) ;

endmodule

module ES(output es, input x, y, z);

    assign es = (~x&~z)|(x&~y);

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

	$display("Exemplo - Larissa Gomes - 65052");
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