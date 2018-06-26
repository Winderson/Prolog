% ******************************************************
% Nome: Winderson Jose Barboza dos Santos
% Curso: Ciência da computação
% Disciplina: Paradigmas de linguagem de programação
% ******************************************************


% Exercício 1 - Prolog

pessoa(winderson).
passaro(joao).
peixe(pedro).
minhoca(maria).
nome(chuckNorris).
gato(chuckNorris).
gato(jerry).

meuGato(X):-
	gostaPeixes(X);
	gostaPassaros(X);
	nome(X).

gostaMinhocas(X):-
	passaro(X).
	
gostaPeixes(X):-
	gato(X).

gostaPassaros(X):-
	gato(X).
	
meuAmigo(X):-
	meuGato(X).
	
% Exercício 2 - Prolog	

homem(X):-
	X==marcos;
	X==silvio;
	X==fabio;
	X==dioni;
	X==anderson.
	
mulher(X):-
	X==cassia;
	X==ana.

amavel(X):-
	X==silvio;
	X==dioni.

rico(X):-
	X==ana;
	X==marcos;
	X==dioni.

forte(X):-
	X==ana;
	X==fabio;
	X==silvio;
	X==dioni.

bonito(X):-
	X==cassia;
	X==marcos;
	X==fabio.
	
todosHomensGostam(X):-
	mulher(X),
	bonito(X).
	
% Pessoa/ pessoa de quem gosta
gosta(cassia,fabio).
gosta(fabio,cassia).
gosta(silvio,ana).
gosta(marcos,ana).
gosta(ana,marcos).
gosta(dioni,cassia).
gosta(anderson,cassia).	
	
	
% param1: pessoa
% param2: pessoa de quem gosta	

pessoasFelizes(X,Y):-
	homem(X)->(
		rico(X);
		gosta(X,Y),
		gosta(Y,X)
	);(
		gosta(X,Y),
		gosta(Y,X)
	).
	
% param1: mulher
% param2: homem	

mulheresGostam(M,H):-
	M==ana->(
		gosta(H,M)
	);(
		M==cassia->(
			gosta(H,M),
			rico(H);
			amavel(H);
			bonito(H),
			forte(H)
		)
	).
	
% Exercicio 3 - Prolog

aluno(joao, calculo).
aluno(maria, calculo).
aluno(joel, programacao).
aluno(joel, estrutura).
frequenta(joao, puc).
frequenta(maria, puc).
frequenta(joel, ufrj).
professor(carlos, calculo).
professor(ana_paula, estrutura).
professor(pedro, programacao).
funcionario(pedro, ufrj).
funcionario(ana_paula, puc).
funcionario(carlos, puc).

% param1: Aluno
% param2: Disciplina

frequentaDisciplinaCalculo(A,D):-
	D==calculo->(
		frequenta(A,D)
	).
	
meuProfessor(P,A):-
	professor(P,calculo)->(
		aluno(A,calculo)
	);(
		professor(P,escrutura)->(
			aluno(A,estrutura)
		);(
			aluno(A,programacao)
		)
	).
	
associadasUniversidade(X):-
	funcionario(F,X),
	(
		writeln(F)
	),
	frequenta(A,X),
	(
		writeln(A)
	).
	
% Exercicio 4 - Prolog
   
nota(joao,5.0).
nota(maria,6.0).
nota(joana,8.0).
nota(mariana,9.0).
nota(cleuza,8.5).
nota(jose,6.5).
nota(jaoquim,4.5).
nota(mara,4.0).
nota(mary,10.0).

mediaAluno(X):-
	nota(X,N),
	(
		N >= 7.0, N<10.0->write("Aprovado");
		N >= 5.0, N<6.9->write("Final");
		N >= 0.0, N<4.9->write("Reprovado")
	).
	
% Exercicio 5 - Prolog

genero(amnesia,suspense).
genero(babel,drama).
genero(capote,drama).
genero(casablanca,romance).
genero(matrix,ficcao).
genero(rebecca,suspense).
genero(shrek,aventura).
genero(sinais,ficcao).
genero(spartacus,acao).
genero(superman,aventura).
genero(titanic,romance).
genero(tubarao,supense).
genero(volver,drama).
diretor(amnesia,nolan).
diretor(babel,inarritu).
diretor(capote,miller).
diretor(casablanca,curtiz).
diretor(matrix,wachowsk).
diretor(rebecca,hitchcock).
diretor(shrek,adamson).
diretor(sinais,shymalan).
diretor(spartacus,kubrik).
diretor(superman,donner).
diretor(titanic,cameron).
diretor(tubarao,spielberg).
diretor(volver,almodovar).
ano(amnesia,2000).
ano(babel,2006).
ano(capote,2005).
ano(casablanca,1942).
ano(matrix,1999).
ano(rebecca,1940).
ano(shrek,2001).
ano(sinais,2002).
ano(spartacus,1960).
ano(superman,1978).
ano(titanic,1997).
ano(tubarao,1975).
ano(volver,2006).
tempo(amnesia,113).
tempo(babel,142).
tempo(capote,98).
tempo(casablanca,102).
tempo(matrix,136).
tempo(rebecca,130).
tempo(shrek,90).
tempo(sinais,106).
tempo(spartacus,184).
tempo(superman,143).
tempo(titanic,194).
tempo(tubarao,124).
tempo(volver,121).

% param1: Titulo
direcao(T):-
	diretor(T,D),
	(
		writeln(D)
	).
	
% param1: Genero
filmesGenero(G):-
	genero(T,G),
	(
		writeln(T)
	).
	
% param1: Titulo
anoLancamento(T):-
	ano(T,A),
	(
		write(A)
	).

% param1: Titulo
filmesMenosCemMinutos():-
	tempo(T,M),
	(
		M<100->(
			writeln(T),
			writeln(M)
		)
	).
	
filmesLancados():-
	ano(T,A),
	(
		(A>=2000,A=<2005)->write(T)
	).
	
classicos():-
	ano(T,A),
	(
		(A<1980)->writeln(T)
	).
	
% param1: titulo
classico(casablanca).
classico(spartacus).
classico(superman).
classico(tubarao).
	
classicosSuspense():-
	classico(T),
	genero(T,G),
	(
		G==suspense->(
			writeln(T)
		)
	).
	
	
	



	
	

	
	

	
	