#!/bin/bash


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
        *) echo 'Nie znaleziono pasującej grupy';;
    esac
done

  passwdLength=$2;
fi
  


  i=1;
  passwd="";
  while [ $i -le $passwdLength ]; do
        if [ "$previousTabNumber" ]; then
          while [ $previousTabNumber -eq $tabNumber ]; do tabNumber=$( expr $(expr $RANDOM % 4) + 1 ); done
        else
          tabNumber=$( expr $(expr $RANDOM % 4) + 1 );
        fi
          case $tabNumber in
              1) if [ "$signs" ]; then 
                    tabElement=$( expr $( expr $RANDOM % $signsLength ) );
                    passwd="${passwd}${signs[$tabElement]}";
                 else
                    previousTabNumber=$tabNumber;
                    continue; 
                 fi;;
              2) if [ "$digits" ]; then
                    tabElement=$( expr $( expr $RANDOM % $digitsLength ) );
                    passwd="${passwd}${digits[$tabElement]}";
                 else 
                    previousTabNumber=$tabNumber;
                    continue; 
                 fi;;
              3) if [ "$uCases" ]; then 
                    tabElement=$( expr $( expr $RANDOM % $uCasesLength ) );
                    passwd="${passwd}${uCases[$tabElement]}";
                 else 
                    previousTabNumber=$tabNumber;
                    continue; 
                 fi;;
              4) if [ "$lCases" ]; then 
                    tabElement=$( expr $( expr $RANDOM % $lCasesLength ) );
                    passwd="${passwd}${lCases[$tabElement]}";
                 else 
                    previousTabNumber=$tabNumber;
                    continue; 
                fi;;
        esac
    i=$(expr $i + 1);
    previousTabNumber=$tabNumber;
  done

echo "Password: $passwd";
