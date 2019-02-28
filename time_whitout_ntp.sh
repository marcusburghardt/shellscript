# Made by Marcus Burghardt
# Some alternative aproach to maintain the time of server updated when you
# can't use NTP. This case, we are using HTTP.
# Ah, this script is a quite old. Sometime I update it for CURL and TIMEDATECTL.

hora=$(lynx -dump -accept_all_cookies http://pcdsh01.on.br/ispy.asp | grep $local | awk '{print $3}')
data=$(lynx -dump -accept_all_cookies http://pcdsh01.on.br/ispy.asp | grep $local | awk '{print $2}')

function zeroesq(){
  if [ $1 -lt 10 ];then
     zero="0$1"
  else
     zero="$1"
  fi
  echo "$zero"
}

dia=$(echo $data | cut -f1 -d"/");DD=$(zeroesq $dia)
mes=$(echo $data | cut -f2 -d"/");MM=$(zeroesq $mes)
ano=$(echo $data | cut -f3 -d"/");AAAA=$(zeroesq $ano)

HH=$(echo $hora | cut -f1 -d":")
mm=$(echo $hora | cut -f2 -d":")
ss=$(echo $hora | cut -f3 -d":")

date $MM$DD$HH$mm$AAAA.$ss
hwclock --systohc
