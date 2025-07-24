CC = gcc
CFLAGS = -g -Wall -ansi -pedantic -std=c++11 
#CFLAGS = -g -O0 -std=c99

parser: miniL.lex miniL.y
	bison -d -v --file-prefix=miniL miniL.y
	flex miniL.lex
	g++ $(CFLAGS) -std=c++11 lex.yy.c miniL.tab.c -lfl -o parser
	rm -f lex.yy.c *.output *.tab.c *.tab.h

test: parser
	cat ./tests/min/primes.min | ./parser > ./tests/mil/primes.mil
	cat ./tests/min/mytest.min | ./parser > ./tests/mil/mytest.mil
	cat ./tests/min/A.min | ./parser > ./tests/mil/A.mil
	cat ./tests/min/fibonacci.min | ./parser > ./tests/mil/fibonacci.mil

# 	cat ./tests/min/errors.min | ./parser > ./tests/mil/errors.mil
# 	cat ./tests/min/for.min | ./parser > ./tests/mil/for.mil

miniL: miniL-lex.o miniL-parser.o
	$(CC) $^ -o $@ -lfl

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

miniL-lex.c: miniL.lex miniL-parser.c
	flex -o $@ $< 

miniL-parser.c: miniL.y

	bison -d -v -g -o $@ $<

clean:
	rm -f *.o miniL-lex.c miniL-parser.c miniL-parser.h *.output *.dot miniL

