// ------------------------- 
// Guia06Q3 - Simplificacao
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output a, input x,y,w,z);

	assign a =  (~x&~y&~w&z)|(~x&~y&w&~z)|(~x&y&w&~z)|(~x&y&w&z)|(x&y&w&~z)|(x&y&w&z); 
  

endmodule



module AS (output as, input x, y, w,z);

	assign as = (~x&~y&~w&z)|(x&y&w)|(y&z&w)|(~x&w&~z);

endmodule


module B (output b, input x,y,w,z);

	assign b =  (~x&~y&~w&~z)|(~x&~y&w&~z)|(~x&~y&w&z)|(~x&y&~w&~z)+(~x&y&w&z)|(x&y&~w&~z); 
  

endmodule



module BS (output bs, input x, y, w,z);

	assign bs = (~x&~w&~z)|(y&~w&~z)|(~x&w&z)|(~x&~y&w);

endmodule

module C (output c, input x,y,w,z);

	assign c =  (~x&~y&~w&~z)|(~x&~y&~w&z)|(~x&~y&w&~z)|(~x&~y&w&z)|(~x&y&~w&z)|(x&~y&~w&~z)|(x&~y&~w&z)|(x&y&~w&z); 
  

endmodule



module CS (output cs, input x, y, w,z);

	assign cs = (~y&~w&~z)|(~w&z)|(~x&~y&w);

endmodule


module D (output d, input x,y,w,z);

	assign d = (~x&~y&w&~z)|(~x&y&~w&~z)|(~x&y&w&~z)|( x&~y&~w&~z)|(x&~y&w&~z)|(x&y&~w&~z)|(x&y&w&~z); 
  

endmodule


module DS (output ds, input x, y, w,z);

	assign ds = (y&~w&~z)|(x&~w&~z)|(w&~z);

endmodule

module E (output e, input x,y,w,z);

	assign e = (~x&~y&~w&~z)|(~x&~y&~w&z)|(~x&~y&w&~z)|(~x&y&w&z)|(x&~y&~w&~z)|(x&y&~w&z)|(x&y&w&~z)|(x&y&w&z); 
  

endmodule


module ES (output es, input x, y, w,z);

	assign es = (~y&~w&~z)|(~x&~y&~w)|(~x&~y&~z)|(x&y&z)|(x&y&w)|(y&w&z);

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