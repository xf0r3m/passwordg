#!/bin/bash

if [ ! "$1" ]; then 
    echo "Użycie: ./passwordg.sh [-grupa znaków] <długość hasła>";
    exit 1;
fi

if [ $(echo $1 | grep "[[:digit:]]") ]; then
  
    passwdLength=$1;

    digits=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9");
        digitsLength=$(expr ${#digits[@]} - 1);
    lCases=("z" "y" "x" "w" "v" "u" "t" "s" "r" "q" "p" "o" "n" "m" "l" "k" "j" "i" "h" "g" "f" "e" "d" "c" "b" "a");
        lCasesLength=$(expr ${#lCases[@]} - 1);
    signs=("~" "\`" "'" "!" "@" "#" "\$" "%" "^" "&" "*" "(" ")" "-" "_" "=" "+" "[" "]" "{" "}" "\\" "|" ";" ":" "\"" "," "<" "." ">" "/" "?");
        signsLength=$(expr ${#signs[@]} - 1);
    uCases=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z");
        uCasesLength=$(expr ${#uCases[@]} - 1);

else

    while getopts "dlsu" option; do 

        case $option in 
            'd') digits=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9");
                    digitsLength=$(expr ${#digits[@]} - 1);;
            'l') lCases=("z" "y" "x" "w" "v" "u" "t" "s" "r" "q" "p" "o" "n" "m" "l" "k" "j" "i" "h" "g" "f" "e" "d" "c" "b" "a");
                    lCasesLength=$(expr ${#lCases[@]} - 1);;
            's') signs=("~" "\`" "'" "!" "@" "#" "\$" "%" "^" "&" "*" "(" ")" "-" "_" "=" "+" "[" "]" "{" "}" "\\" "|" ";" ":" "\"" "," "<" "." ">" "/" "?");
                    signsLength=$(expr ${#signs[@]} - 1);;
            'u') uCases=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z");
                    uCasesLength=$(expr ${#uCases[@]} - 1);;
            *) echo "Użycie: ./passwordg.sh [-grupa znaków] <długość hasła>"; exit 1;;
        esac
    done

    if [ ! $(echo $2 | grep "[[:digit:]]") ] || [ ! "$2" ]; then 
        echo "Użycie: ./passwordg.sh [-grupa znaków] <długość hasła>"; exit 1;
    else
        passwdLength=$2;
    fi

fi
  


  i=1;
  passwd="";
  while [ $i -le $passwdLength ]; do
          
          tabNumber=$( expr $(expr $RANDOM % 4) + 1 );

          case $tabNumber in
              1) if [ "$signs" ]; then 
                    tabElement=$( expr $( expr $RANDOM % $signsLength ) );
                    passwd="${passwd}${signs[$tabElement]}";
                 else
                    continue; 
                 fi;;
              2) if [ "$digits" ]; then
                    tabElement=$( expr $( expr $RANDOM % $digitsLength ) );
                    passwd="${passwd}${digits[$tabElement]}";
                 else 
                    continue; 
                 fi;;
              3) if [ "$uCases" ]; then 
                    tabElement=$( expr $( expr $RANDOM % $uCasesLength ) );
                    passwd="${passwd}${uCases[$tabElement]}";
                 else 
                    continue; 
                 fi;;
              4) if [ "$lCases" ]; then 
                    tabElement=$( expr $( expr $RANDOM % $lCasesLength ) );
                    passwd="${passwd}${lCases[$tabElement]}";
                 else 
                    continue; 
                fi;;
        esac
    i=$(expr $i + 1);
  done

echo "Password: $passwd";
