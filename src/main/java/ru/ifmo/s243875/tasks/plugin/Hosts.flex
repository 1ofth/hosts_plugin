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
DEC_OCTET=25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9]
IPV4_DECIMAL={DEC_OCTET}\.{DEC_OCTET}\.{DEC_OCTET}\.{DEC_OCTET}
IPV4={IPV4_DECIMAL}

HEX_DECIMAL=[0-9A-Fa-f]
V6OCTET={HEX_DECIMAL}{1,4}
LEAST32=({V6OCTET}:{V6OCTET}|{IPV4})
IPV6=({V6OCTET}:){6}{LEAST32}|
     ::({V6OCTET}:){5}{LEAST32}|
     ({V6OCTET})?::({V6OCTET}:){4}{LEAST32}|
     (({V6OCTET}:){0,1}{V6OCTET})?::({V6OCTET}:){3}{LEAST32}|
     (({V6OCTET}:){0,2}{V6OCTET})?::({V6OCTET}:){2}{LEAST32}|
     (({V6OCTET}:){0,3}{V6OCTET})?::{V6OCTET}:{LEAST32}|
     (({V6OCTET}:){0,4}{V6OCTET})?::{LEAST32}|
     (({V6OCTET}:){0,5}{V6OCTET})?::{V6OCTET}|
     (({V6OCTET}:){0,6}{V6OCTET})?::

IP={IPV4}|{IPV6}
DOMAIN=[a-zA-Z]([-a-zA-Z0-9\.]*[a-zA-Z0-9])?


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
{WHITE_SPACE}*{CRLF}          {System.out.println("State: " + this.zzLexicalState + " " + this.yytext());  yybegin(YYINITIAL); return TokenType.WHITE_SPACE; }
[^]                                      {System.out.println("Error: " + this.zzLexicalState + " " + this.yytext());  return TokenType.BAD_CHARACTER; }
