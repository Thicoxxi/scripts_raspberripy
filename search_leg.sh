#!/bin/bash
set -x 
SERIES=('American_Gods' 'American_Horror_Story' 'arrow' 'Castle_Rock' 'Doctor_Who' 'DuckTales_2017' 'flash' 'Game_of_Thrones' 'Hawaii_Five-0' 'Homeland' 'Krypton' 'legends_of_tomorrow' 'Lethal_Weapon' 'macgyver' 'Marvels_Agents_of_S.H.I.E.L.D' 'Silicon_Valley' 'supergirl' 'supernatural' 'the_100' 'the_big_bang_theory' 'the_blacklist' 'The_Gifted' 'The_Good_Doctor' 'Timeless' 'Titans_2018' 'Westworld' 'Young_Sheldon') # matriz de series

# Função para verificar se existe legenda para seriados
#===============================================================================
# Function search_leg
#===============================================================================
function search_leg {

    for leg in ${SERIES[*]};do # Lista seriados
         subliminal -l pt-br $DIR/${leg[*]} # baixa legenda se exitir

    done
}

DIR=/media/lv-series # diretorio de series

search_leg
