#!/bin/bash
set -x

# Função para verificar se existe legenda para seriados
#===============================================================================
# Function search_leg
#===============================================================================
function search_leg {

    for leg in ${lista[*]};do # Lista filmes e  seriados
         subliminal download -l pt-br $DIR/${leg[*]} # baixa legenda se exitir
         subliminal download -l en  $DIR/${leg[*]}

    done
}

DIR=/media/lv-filmes # diretorio de filmes
lista=(`ls /media/lv-filmes`) #lista filmes baixados
chmod -R 777 $DIR
search_leg # executa funcao

DIR=/media/lv-series # diretorio de series
lista=(`ls /media/lv-series`) # lista series baixadas
chmod -R 777 $DIR
search_leg
~          
