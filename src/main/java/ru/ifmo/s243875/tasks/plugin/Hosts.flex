package ru.ifmo.s243875.tasks.plugin;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import com.intellij.psi.TokenType;
import ru.ifmo.s243875.tasks.plugin.psi.HostsTypes;

%%

%class HostsLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType

CRLF=\R
WHITE_SPACE=[\ \n\r\t\f]
END_OF_LINE_COMMENT=("#"|"!")[^\r\n]*
KEY_SEPARATOR_SPACE=[\ \t]
DEC_OCTET=25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?
IPV4_DECIMAL={DEC_OCTET}\.{DEC_OCTET}\.{DEC_OCTET}\.{DEC_OCTET}
IPV4={IPV4_DECIMAL}
IP={IPV4}
DOMAIN=[a-zA-Z]([a-zA-Z0-9\.]*[a-zA-Z0-9])?


%state IN_KEY_VALUE_SEPARATOR_HEAD
%state IN_KEY_VALUE_SEPARATOR_TAIL

%%

<YYINITIAL> {END_OF_LINE_COMMENT}        { System.out.println("Comment: " + this.zzLexicalState + " " + this.yytext()); yybegin(YYINITIAL); return HostsTypes.COMMENT; }

<YYINITIAL> {IP}             {  System.out.println("IP: " + this.zzLexicalState + " " + this.yytext()); yybegin(IN_KEY_VALUE_SEPARATOR_HEAD); return HostsTypes.IP; }
<IN_KEY_VALUE_SEPARATOR_HEAD> {
        {KEY_SEPARATOR_SPACE}+       { System.out.println("Space: " + this.zzLexicalState + " " + this.yytext()); yybegin(IN_KEY_VALUE_SEPARATOR_TAIL); return TokenType.WHITE_SPACE; }
}
<IN_KEY_VALUE_SEPARATOR_TAIL> {
    {KEY_SEPARATOR_SPACE}+  {System.out.println("Space: " + this.zzLexicalState + " " + this.yytext());  yybegin(IN_KEY_VALUE_SEPARATOR_TAIL); return TokenType.WHITE_SPACE; }
    {DOMAIN}   { System.out.println("Domain: " + this.zzLexicalState + " " + this.yytext()); yybegin(IN_KEY_VALUE_SEPARATOR_TAIL); return HostsTypes.VALUE; }
//    {CRLF}+  { System.out.println("New Line: " + this.zzLexicalState + " " + this.yytext()); System.out.println(); yybegin(YYINITIAL); return TokenType.WHITE_SPACE; }
    {END_OF_LINE_COMMENT}        { System.out.println("Comment: " + this.zzLexicalState + " " + this.yytext()); yybegin(YYINITIAL); return HostsTypes.COMMENT; }
}
({CRLF}|{WHITE_SPACE})+          {System.out.println("State: " + this.zzLexicalState + " " + this.yytext());  yybegin(YYINITIAL); return TokenType.WHITE_SPACE; }
[^]                                      {System.out.println("Error: " + this.zzLexicalState + " " + this.yytext());  return TokenType.BAD_CHARACTER; }
