singlish-converter: lex.yy.c
	gcc ./lex.yy.c -o singlish-converter -ll

lex.yy.c: singlish.l
	flex singlish.l