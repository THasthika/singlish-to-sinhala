%{
#include <stdio.h>
#include <wchar.h>
#include <locale.h>
%}

%s word

 void writeChar(wchar_t a) {
    wprintf(L"%lc", a); 
 }

 void write2Char(wchar_t a, wchar_t b) {
    wprintf(L"%lc%lc", a, b); 
 }

 void write3Char(wchar_t a, wchar_t b, wchar_t c) {
    wprintf(L"%lc%lc%lc", a, b, c); 
 }

 void write4Char(wchar_t a, wchar_t b, wchar_t c, wchar_t d) {
    wprintf(L"%lc%lc%lc%lc", a, b, c, d); 
 }

%%


<word>ruu           {writeChar(0x0DF2); BEGIN(INITIAL);}
<word>ru            {writeChar(0x0DD8); BEGIN(INITIAL);}

<word>r             {write3Char(0x0DCA, 0x200D, 0x0DBB); BEGIN(word);}

<word>au            {writeChar(0x0DDE); BEGIN(INITIAL);}
<word>I             {writeChar(0x0DDB); BEGIN(INITIAL);}

<word>oe            {writeChar(0x0DDD); BEGIN(INITIAL);}
<word>o             {writeChar(0x0DDC); BEGIN(INITIAL);}
<word>ei            {writeChar(0x0DDA); BEGIN(INITIAL);}
<word>e             {writeChar(0x0DD9); BEGIN(INITIAL);}
<word>uu            {writeChar(0x0DD6); BEGIN(INITIAL);}
<word>u             {writeChar(0x0DD4); BEGIN(INITIAL);}
<word>ie            {writeChar(0x0DD3); BEGIN(INITIAL);}
<word>i             {writeChar(0x0DD2); BEGIN(INITIAL);}
<word>Aa            {writeChar(0x0DD1); BEGIN(INITIAL);}
<word>A             {writeChar(0x0DD0); BEGIN(INITIAL);}
<word>aa            {writeChar(0x0DCF); BEGIN(INITIAL);}
<word>a             {BEGIN(INITIAL);}
<word>.             {writeChar(0x0DCA); BEGIN(INITIAL); REJECT}
<word>\n            {writeChar(0x0DCA); BEGIN(INITIAL);}

nndh                {writeChar(0x0DB3); BEGIN(word);}
nng                 {writeChar(0x0D9F); BEGIN(word);}
nnd                 {writeChar(0x0DAC); BEGIN(word);}

k                   {writeChar(0x0D9A); BEGIN(word);}
(kh|K)              {writeChar(0x0D9B); BEGIN(word);}
g                   {writeChar(0x0D9C); BEGIN(word);}
(gh|G)              {writeChar(0x0D9D); BEGIN(word);}

j                   {writeChar(0x0DA2); BEGIN(word);}
q                   {writeChar(0x0DA3); BEGIN(word);}
ch                  {writeChar(0x0DA0); BEGIN(word);}
Ch                  {writeChar(0x0DA1); BEGIN(word);}

th                  {writeChar(0x0DAD); BEGIN(word);}
Th                  {writeChar(0x0DAE); BEGIN(word);}
dh                  {writeChar(0x0DAF); BEGIN(word);}
Dh                  {writeChar(0x0DB0); BEGIN(word);}
n                   {writeChar(0x0DB1); BEGIN(word);}

t                   {writeChar(0x0DA7); BEGIN(word);}
T                   {writeChar(0x0DA8); BEGIN(word);}
d                   {writeChar(0x0DA9); BEGIN(word);}
D                   {writeChar(0x0DAA); BEGIN(word);}
N                   {writeChar(0x0DAB); BEGIN(word);}

(ph|P)              {writeChar(0x0DB5); BEGIN(word);}
bh                  {writeChar(0x0DB7); BEGIN(word);}
p                   {writeChar(0x0DB4); BEGIN(word);}
b                   {writeChar(0x0DB6); BEGIN(word);}
m                   {writeChar(0x0DB8); BEGIN(word);}
B                   {writeChar(0x0DB9); BEGIN(word);}

y                   {writeChar(0x0DBA); BEGIN(word);}
r                   {writeChar(0x0DBB); BEGIN(word);}
l                   {writeChar(0x0DBD); BEGIN(word);}
(w|v)               {writeChar(0x0DC0); BEGIN(word);}

sh                  {writeChar(0x0DC1); BEGIN(word);}
Sh                  {writeChar(0x0DC2); BEGIN(word);}
s                   {writeChar(0x0DC3); BEGIN(word);}
h                   {writeChar(0x0DC4); BEGIN(word);}
L                   {writeChar(0x0DC5); BEGIN(word);}
f                   {writeChar(0x0DC6); BEGIN(word);}

KN                  {writeChar(0x0da4); BEGIN(word);}
GN                  {writeChar(0x0da5); BEGIN(word);}

au                  writeChar(0x0D96);
(uu|oo)             writeChar(0x0D8C);
u                   writeChar(0x0D8B);
oe                  writeChar(0x0D95);
o                   writeChar(0x0D94);
(ea|ei)             writeChar(0x0D92);
(ii|ie|ee)          writeChar(0x0D8A);
e                   writeChar(0x0D91);
i                   writeChar(0x0D89);
(Aa|ae)             writeChar(0x0D88);
(A|\\a)             writeChar(0x0D87);
aa                  writeChar(0x0D86);
a                   writeChar(0x0D85);

.                   wprintf(L"%s", yytext);
\n                  wprintf(L"%s", yytext);
%%

int main()
{
    setlocale(LC_CTYPE, "");
    yylex();
    return 0;
}
