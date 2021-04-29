main: lex.yy.c
	gcc ./lex.yy.c -o main -ll

lex.yy.c: singlish.l
	flex singlish.l
