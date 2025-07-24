CC = gcc
CFLAGS = -g -O0 -std=c99

mini_l: mini_l-lex.o mini_l-parser.o

	$(CC) $^ -o $@ -lfl

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

mini_l-lex.c: mini_l.lex mini_l-parser.c
	flex -o $@ $< 

mini_l-parser.c: mini_l.y

	bison -d -v -g -o $@ $<



clean:
	rm -f *.o mini_l-lex.c mini_l-parser.c mini_l-parser.h *.output *.dot mini_l

