#!/bin/bash
###############
# Just for didatical goals
# Made by Marcus Burghardt
###############

# Esse e um script para praticar os laços.

# Exemplo de laco usando for.
echo "Inicio do laco com FOR."
for i in `seq 1 10`; do
  echo -n "$i ";
done
echo -e "\nFim do laco com FOR.\n"

# Executa "ate" encontrar um criterio verdadeiro.
echo "Inicio do laco com UTIL."
CONTADOR="1"
until [ $CONTADOR -eq '10' ]; do
  echo -n "$CONTADOR "
  CONTADOR=`expr $CONTADOR + 1`
done
echo -e "\nFim do laco com UNTIL.\n"

# Executa "enquanto" ocorrer um criterio verdadeiro.
echo "Inicio do laco com WHILE."
CONTADOR="1"
while [ $CONTADOR -le '10' ]; do
  echo -n "$CONTADOR "
  CONTADOR=`expr $CONTADOR + 1`
done
echo -e "\nFim do laco com WHILE.\n"
