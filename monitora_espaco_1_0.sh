#!/bin/bash
set -x
touch /dev/null > /tmp/usohd.txt # Limpa arquivo que armazenapotcentagem de uso da partição
PAR=('/media/lv-filmes' '/media/lv-series' '/media/lv-torrents') # matriz de partições

# Função para verificar espaço em disco
#===============================================================================
# Function espacohd
#===============================================================================
function espacohd {

    for par in ${PAR[*]};do # Lista partições
        USO=`df -h ${par[*]} | tail -1 | awk '{print $5}'| sed "s/%//g"` # verifica uso da partição
        if [ "$USO" -gt "80" ]; then # Compara se partição esta com 80% de uso
            echo "Particao "$par" esta com "$USO"% de uso! Favor verificar!" >> /tmp/usohd.txt # armazena uso da partição em txt
        fi


    done
}

espacohd # chama função 

if [ ! -s /tmp/usohd.txt ] ;then # verifica se tem mensagem de uso de partição no arquivo txt
echo "Arquivo esta vazio!" # imprime mensagem que o arquivo txt esta vazio e não envia email
else
cat /tmp/usohd.txt | mail -s '[Utilizacao do disco do Rpi de series, filmes e torrents  com mais 80%]' thiago.mliberati@gmail.com # manda mensagem atraves do postfix alertando uso da partição
fi
