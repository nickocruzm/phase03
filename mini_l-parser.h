/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFIER = 258,
     NUMBER = 259,
     FUNCTION = 260,
     BEGINPARAMS = 261,
     ENDPARAMS = 262,
     BEGINLOCALS = 263,
     ENDLOCALS = 264,
     BEGINBODY = 265,
     ENDBODY = 266,
     INTEGER = 267,
     ARRAY = 268,
     OF = 269,
     IF = 270,
     THEN = 271,
     ELSE = 272,
     ENDIF = 273,
     WHILE = 274,
     DO = 275,
     BEGINLOOP = 276,
     ENDLOOP = 277,
     CONTINUE = 278,
     READ = 279,
     WRITE = 280,
     FOREACH = 281,
     IN = 282,
     RETURN = 283,
     ASSIGN = 284,
     SEMICOLON = 285,
     COLON = 286,
     COMMA = 287,
     L_PAREN = 288,
     R_PAREN = 289,
     L_SQUARE_BRACKET = 290,
     R_SQUARE_BRACKET = 291,
     PLUS = 292,
     MINUS = 293,
     MULT = 294,
     DIV = 295,
     MOD = 296,
     EQ = 297,
     NEQ = 298,
     LT = 299,
     LTE = 300,
     GT = 301,
     GTE = 302,
     AND = 303,
     OR = 304,
     NOT = 305,
     TRUE = 306,
     FALSE = 307,
     ENUM = 308,
     UMINUS = 309
   };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define NUMBER 259
#define FUNCTION 260
#define BEGINPARAMS 261
#define ENDPARAMS 262
#define BEGINLOCALS 263
#define ENDLOCALS 264
#define BEGINBODY 265
#define ENDBODY 266
#define INTEGER 267
#define ARRAY 268
#define OF 269
#define IF 270
#define THEN 271
#define ELSE 272
#define ENDIF 273
#define WHILE 274
#define DO 275
#define BEGINLOOP 276
#define ENDLOOP 277
#define CONTINUE 278
#define READ 279
#define WRITE 280
#define FOREACH 281
#define IN 282
#define RETURN 283
#define ASSIGN 284
#define SEMICOLON 285
#define COLON 286
#define COMMA 287
#define L_PAREN 288
#define R_PAREN 289
#define L_SQUARE_BRACKET 290
#define R_SQUARE_BRACKET 291
#define PLUS 292
#define MINUS 293
#define MULT 294
#define DIV 295
#define MOD 296
#define EQ 297
#define NEQ 298
#define LT 299
#define LTE 300
#define GT 301
#define GTE 302
#define AND 303
#define OR 304
#define NOT 305
#define TRUE 306
#define FALSE 307
#define ENUM 308
#define UMINUS 309




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 12 "mini_l.y"
{
    char* str_val;
    int int_val;
}
/* Line 1529 of yacc.c.  */
#line 162 "mini_l-parser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif

extern YYLTYPE yylloc;
