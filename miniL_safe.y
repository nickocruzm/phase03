%{
    // Prologue
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char *msg);
    extern int yylex();
    extern int yylineno;
    extern char* yytext;
    extern FILE* yyin;
%}


%union{
    char* str_val;
    int int_val;
}

%error-verbose
%locations

/* Token declarations */
%token <str_val> IDENTIFIER
%token <int_val> NUMBER
%token FUNCTION BEGINPARAMS ENDPARAMS BEGINLOCALS ENDLOCALS BEGINBODY ENDBODY
%token INTEGER ARRAY OF IF THEN ELSE ENDIF WHILE DO BEGINLOOP ENDLOOP
%token CONTINUE READ WRITE FOREACH IN RETURN
%token ASSIGN SEMICOLON COLON COMMA
%token L_PAREN R_PAREN L_SQUARE_BRACKET R_SQUARE_BRACKET
%token PLUS MINUS MULT DIV MOD
%token EQ NEQ LT LTE GT GTE
%token AND OR NOT
%token TRUE FALSE
%token ENUM

/* Operator precedence and associativity (lowest to highest) */
%right ASSIGN
%left OR
%left AND
%right NOT
%left EQ NEQ LT LTE GT GTE
%left PLUS MINUS
%left MULT DIV MOD
%right UMINUS
%left L_SQUARE_BRACKET
%left L_PAREN

/* Start symbol */
%start program

%%

program: functions;

functions: /*empty*/
        |function functions
        {
            printf("functions -> function functions\n");
        }
        ;

function: FUNCTION IDENTIFIER SEMICOLON 
BEGINPARAMS declarations ENDPARAMS 
BEGINLOCALS declarations ENDLOCALS 
BEGINBODY statements ENDBODY
        {
            printf("function -> FUNCTION IDENTIFIER SEMICOLON BEGINPARAMS declarations ENDPARAMS BEGINLOCALS declarations ENDLOCALS BEGINBODY statements ENDBODY\n");
        }
        ;

declarations: /* empty */
            {
                printf("declarations -> epsilon\n");
            }
            | declaration SEMICOLON declarations
            {
                printf("declarations -> declarations declaration\n");
            }
            ;

declaration: identifiers COLON INTEGER SEMICOLON
           {
               printf("declaration -> identifiers COLON INTEGER SEMICOLON\n");
           }
           | identifiers COLON ARRAY L_SQUARE_BRACKET NUMBER R_SQUARE_BRACKET OF INTEGER SEMICOLON
           {
               printf("declaration -> identifiers COLON ARRAY L_SQUARE_BRACKET NUMBER R_SQUARE_BRACKET OF INTEGER SEMICOLON\n");
           }
           | identifiers COLON ENUM L_PAREN enum_list R_PAREN SEMICOLON
           {
               printf("declaration -> identifiers COLON ENUM L_PAREN enum_list R_PAREN SEMICOLON\n");
           }
           ;

identifiers: IDENTIFIER
           {
               printf("identifiers -> IDENTIFIER\n");
           }
           | identifiers COMMA IDENTIFIER
           {
               printf("identifiers -> identifiers COMMA IDENTIFIER\n");
           }
           ;

enum_list: IDENTIFIER
         | enum_list COMMA IDENTIFIER
         ;

statements: /* empty */
          {
              printf("statements -> epsilon\n");
          }
          | statements statement
          {
              printf("statements -> statements statement\n");
          }
          ;

statement: var ASSIGN expression SEMICOLON
         {
             printf("statement -> var ASSIGN expression SEMICOLON\n");
         }
         | IF bool_expr THEN statements ENDIF opt_semi
         {
             printf("statement -> IF bool_expr THEN statements ENDIF\n");
         }
         | IF bool_expr THEN statements ELSE statements ENDIF opt_semi
         {
             printf("statement -> IF bool_expr THEN statements ELSE statements ENDIF\n");
         }
         | WHILE bool_expr BEGINLOOP statements ENDLOOP opt_semi
         {
             printf("statement -> WHILE bool_expr BEGINLOOP statements ENDLOOP\n");
         }
         | DO BEGINLOOP statements ENDLOOP WHILE bool_expr SEMICOLON
         {
             printf("statement -> DO BEGINLOOP statements ENDLOOP WHILE bool_expr SEMICOLON\n");
         }
         | FOREACH IDENTIFIER IN IDENTIFIER BEGINLOOP statements ENDLOOP opt_semi
         {
             printf("statement -> FOREACH IDENTIFIER IN IDENTIFIER BEGINLOOP statements ENDLOOP\n");
         }
         | READ vars SEMICOLON
         {
             printf("statement -> READ vars SEMICOLON\n");
         }
         | WRITE vars SEMICOLON
         {
             printf("statement -> WRITE vars SEMICOLON\n");
         }
         | CONTINUE SEMICOLON
         {
             printf("statement -> CONTINUE SEMICOLON\n");
         }
         | RETURN expression SEMICOLON
         {
             printf("statement -> RETURN expression SEMICOLON\n");
         }
         ;

opt_semi: /* empty */
        | SEMICOLON
        ;

vars: var
    {
        printf("vars -> var\n");
    }
    | var COMMA vars
    {
        printf("vars -> var COMMA vars\n");
    }
    ;

bool_expr: relation_and_expr
         {
             printf("bool_expr -> relation_and_expr\n");
         }
         | bool_expr OR relation_and_expr
         {
             printf("bool_expr -> bool_expr OR relation_and_expr\n");
         }
         ;

relation_and_expr: relation_expr
                 {
                     printf("relation_and_expr -> relation_expr\n");
                 }
                 | relation_and_expr AND relation_expr
                 {
                     printf("relation_and_expr -> relation_and_expr AND relation_expr\n");
                 }
                 ;

relation_expr: expression comp expression
             {
                 printf("relation_expr -> expression comp expression\n");
             }
             | NOT expression comp expression
             {
                 printf("relation_expr -> NOT expression comp expression\n");
             }
             | NOT L_PAREN bool_expr R_PAREN
             {
                 printf("relation_expr -> NOT L_PAREN bool_expr R_PAREN\n");
             }
             | L_PAREN bool_expr R_PAREN
             {
                 printf("relation_expr -> L_PAREN bool_expr R_PAREN\n");
             }
             | expression
             {
                 printf("relation_expr -> expression\n");
             }
             | TRUE
             {
                 printf("relation_expr -> TRUE\n");
             }
             | FALSE
             {
                 printf("relation_expr -> FALSE\n");
             }
             ;

comp: EQ
    {
        printf("comp -> EQ\n");
    }
    | NEQ
    {
        printf("comp -> NEQ\n");
    }
    | LT
    {
        printf("comp -> LT\n");
    }
    | LTE
    {
        printf("comp -> LTE\n");
    }
    | GT
    {
        printf("comp -> GT\n");
    }
    | GTE
    {
        printf("comp -> GTE\n");
    }
    ;

expression: multiplicative_expr
          {
              printf("expression -> multiplicative_expr\n");
          }
          | expression PLUS multiplicative_expr
          {
              printf("expression -> expression PLUS multiplicative_expr\n");
          }
          | expression MINUS multiplicative_expr
          {
              printf("expression -> expression MINUS multiplicative_expr\n");
          }
          ;

multiplicative_expr: term
                   {
                       printf("multiplicative_expr -> term\n");
                   }
                   | multiplicative_expr MULT term
                   {
                       printf("multiplicative_expr -> multiplicative_expr MULT term\n");
                   }
                   | multiplicative_expr DIV term
                   {
                       printf("multiplicative_expr -> multiplicative_expr DIV term\n");
                   }
                   | multiplicative_expr MOD term
                   {
                       printf("multiplicative_expr -> multiplicative_expr MOD term\n");
                   }
                   ;

term: var
    {
        printf("term -> var\n");
    }
    | NUMBER
    {
        printf("term -> NUMBER\n");
    }
    | L_PAREN expression R_PAREN
    {
        printf("term -> L_PAREN expression R_PAREN\n");
    }
    | MINUS term %prec UMINUS
    {
        printf("term -> MINUS term\n");
    }
    | IDENTIFIER L_PAREN expressions R_PAREN
    {
        printf("term -> IDENTIFIER L_PAREN expressions R_PAREN\n");
    }
    ;

var: IDENTIFIER
   {
       printf("var -> IDENTIFIER\n");
   }
   | IDENTIFIER L_SQUARE_BRACKET expression R_SQUARE_BRACKET
   {
       printf("var -> IDENTIFIER L_SQUARE_BRACKET expression R_SQUARE_BRACKET\n");
   }
   ;

expressions: /* empty */
           {
               printf("expressions -> epsilon\n");
           }
           | expression
           {
               printf("expressions -> expression\n");
           }
           | expressions COMMA expression
           {
               printf("expressions -> expressions COMMA expression\n");
           }
           ;

%%

int main(int argc, char **argv){
    if(argc > 1){
        yyin = fopen(argv[1], "r");
        if(yyin == NULL){
            printf("syntax %s filename\n", argv[0]);
        }
    }
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    printf("Syntax error at line %d: %s\n", yylineno, msg);
}