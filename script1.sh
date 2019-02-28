#!/bin/bash
###############
# Just for didatical goals
# Made by Marcus Burghardt
###############

# Esse e um script para praticar as variaveis especiais.

# Verifica se foram passados os argumentos corretos.
if [ $# -lt 2 ]; then
        echo -e "\nNumero de argumentos incorreto. Voce digitou $# argumento(s). A sintaxe correta e:"
        echo -e "$0 <comando sleep> <tempo>\n"
        exit
else
        echo -e "\nCerto. Voce digitou $# argumentos. Seguem os argumentos digitados:"
        echo -e "$*"
fi

# Informa quais foram os argumentos.
echo -e "\nO seu primeiro argumento foi: $1"
echo -e "O seu segundo argumento foi: $2"

# Coleta os segundos antes de iniciar o processo sleep.
SEGUNDOS_INICIAIS="`date +%s`"

# Inicia um processo para pegar seu PID.
$1 $2 &
PIDSLEEP=$!
echo -e "\nIniciado o processo \"$1 $2\" com o PID $PIDSLEEP"

# Certifica que o processo esta rodando.
ps -p $PIDSLEEP

# Pergunta se deseja finalizar o processo antes do tempo.
echo -e "\nGostaria de finalizar o processo agora (S|N)?"
read RESPOSTA

# Se a resposta for "S", finaliza o processo. Senao informa quando ele vai finalzar.
if [ $RESPOSTA == 'S' ]; then
        kill $PIDSLEEP
        ps -p $PIDSLEEP
else
        SEGUNDOS_FINAIS="`date +%s`"
        PASSADOS=`expr $SEGUNDOS_FINAIS - $SEGUNDOS_INICIAIS`
        echo -e "\nOk. Ele vai finalizar automaticamente em `expr $2 - $PASSADOS` segundos.\n"
        ps -p $PIDSLEEP
fi

