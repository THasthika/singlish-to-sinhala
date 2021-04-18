# Singlish to Sinhala

Convert Singlish text to Sinhala Unicode based on Flex lexical analyzer

## How to Build

```bash
flex singlish.l
gcc ./lex.yy.c -o singlish-converter -ll

## OR

make
```

## How to Run

```bash
echo "ammaa" | ./sinhala-converter > out.txt

## cat out.txt -> අම්මා
```