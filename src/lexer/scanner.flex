/* ----------------- Secção 1: Código do Utilizador ----------------- */
package lexer;

import java_cup.runtime.Symbol;
import parser.sym; // Importa o contrato de tokens gerado pelo JCup

%%

/* ----------------- Secção 2: Opções e Declarações ----------------- */
%class Lexer         // Define o nome da classe gerada (Lexer.java)
%public              // A classe será pública
%line                // Ativa a contagem de linhas (variável yyline)
%column              // Ativa a contagem de colunas (variável yycolumn)
%cup                 // Ativa a compatibilidade estrita com o JCup

/* Definições de Macros (Expressões Regulares Auxiliares) */
Branco        = [ \t\r\n]
Digito        = [0-9]
Letra         = [a-zA-Z]
Identificador = {Letra}({Letra}|{Digito})*
Inteiro       = {Digito}+

// Definição de Comentário de Linha
Comentario    = "//" [^\r\n]*

%%

/* ----------------- Secção 3: Regras Léxicas ----------------- */

/* 1. Palavras-chave (Keywords) */
"if"            { return new Symbol(sym.IF, yyline, yycolumn); }
"else"          { return new Symbol(sym.ELSE, yyline, yycolumn); }
"while"         { return new Symbol(sym.WHILE, yyline, yycolumn); }
"int"           { return new Symbol(sym.INT, yyline, yycolumn); }

/* 2. Operadores e Delimitadores */
"="             { return new Symbol(sym.ATRIB, yyline, yycolumn); }
"+"             { return new Symbol(sym.MAIS, yyline, yycolumn); }
"-"             { return new Symbol(sym.MENOS, yyline, yycolumn); }
";"             { return new Symbol(sym.PONTO_VIRGULA, yyline, yycolumn); }
"("             { return new Symbol(sym.APAR, yyline, yycolumn); }
")"             { return new Symbol(sym.FPAR, yyline, yycolumn); }
"{"             { return new Symbol(sym.ACHAVE, yyline, yycolumn); }
"}"             { return new Symbol(sym.FCHAVE, yyline, yycolumn); }

/* 3. Constantes e Identificadores (Passam valor semântico) */
{Inteiro}       { return new Symbol(sym.NUM, yyline, yycolumn, Integer.parseInt(yytext())); }
{Identificador} { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }

/* 4. Descarte (Espaços vazios e Comentários) */
{Branco}        { /* Não faz nada, apenas descarta */ }
{Comentario}    { /* Não faz nada, apenas descarta */ }

/* 5. Tratamento de Erros Léxicos */
[^]             { throw new Error("Erro Léxico: Caractere inválido <" + yytext() + "> na linha " + (yyline+1) + ", coluna " + (yycolumn+1)); }