/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TKN_NUM = 258,
    ZERO = 259,
    ONE = 260,
    TKN_ASIGN = 261,
    TKN_PTOCOMA = 262,
    TKN_MULT = 263,
    TKN_DIV = 264,
    TKN_MAS = 265,
    TKN_MENOS = 266,
    TKN_ELEV = 267,
    TKN_RAIZ = 268,
    TKN_LOGNAT = 269,
    TKN_E = 270,
    TKN_PAA = 271,
    TKN_PAC = 272,
    TKN_COS = 273,
    TKN_SEN = 274,
    TKN_ID = 275
  };
#endif
/* Tokens.  */
#define TKN_NUM 258
#define ZERO 259
#define ONE 260
#define TKN_ASIGN 261
#define TKN_PTOCOMA 262
#define TKN_MULT 263
#define TKN_DIV 264
#define TKN_MAS 265
#define TKN_MENOS 266
#define TKN_ELEV 267
#define TKN_RAIZ 268
#define TKN_LOGNAT 269
#define TKN_E 270
#define TKN_PAA 271
#define TKN_PAC 272
#define TKN_COS 273
#define TKN_SEN 274
#define TKN_ID 275

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "proyecto2_1.y"

	float real;

#line 101 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
