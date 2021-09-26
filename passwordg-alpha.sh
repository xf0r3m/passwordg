#!/usr/bin/env bash

if [ $(echo $1 | grep "[[:digit:]]") ]; then
  signs=("~" "\`" "'" "!" "@" "#" "\$" "%" "^" "&" "*" "(" ")" "-" "_" "=" "+" "[" "]" "{" "}" "\\" "|" ";" ":" "\"" "," "<" "." ">" "/" "?");
  signsLength=$(expr ${#signs[@]} - 1);
  #echo "signsLength: $signsLength";
  passwdLength=$1;
else
  passwdLength=$2;
fi
  digits=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9");
  digitsLength=$(expr ${#digits[@]} - 1);
  bLetters=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z");
  bLettersLength=$(expr ${#bLetters[@]} - 1);
  sLetters=("z" "y" "x" "w" "v" "u" "t" "s" "r" "q" "p" "o" "n" "m" "l" "k" "j" "i" "h" "g" "f" "e" "d" "c" "b" "a");
  sLettersLength=$(expr ${#sLetters[@]} - 1);

  #echo "digitsLength: $digitsLength";
  #echo "bLetters: $bLettersLength";
  #echo "sLetters: $sLettersLength";


  i=1;
  passwd="";
  while [ $i -le $passwdLength ]; do
    if [ "$signs" ]; then
        if [ "$previousTabNumber" ]; then
          while [ $previousTabNumber -eq $tabNumber ]; do tabNumber=$( expr $(expr $RANDOM % 4) + 1 ); done
        else
          tabNumber=$( expr $(expr $RANDOM % 4) + 1 );
        fi
          case $tabNumber in
              1)  tabElement=$( expr $( expr $RANDOM % $signsLength ) );
                  passwd="${passwd}${signs[$tabElement]}";;
              2)  tabElement=$( expr $( expr $RANDOM % $digitsLength ) );
                  passwd="${passwd}${digits[$tabElement]}";;
              3)  tabElement=$( expr $( expr $RANDOM % $bLettersLength ) );
                  passwd="${passwd}${bLetters[$tabElement]}";;
              4)  tabElement=$( expr $( expr $RANDOM % $sLettersLength ) );
                  passwd="${passwd}${sLetters[$tabElement]}";;
        esac
    else
        if [ "$previousTabNumber" ]; then
          while [ $previousTabNumber -eq $tabNumber ]; do tabNumber=$( expr $(expr $RANDOM % 3) + 1 ); done
        else
          tabNumber=$( expr $(expr $RANDOM % 3) + 1 );
        fi
        case $tabNumber in
            1)  tabElement=$( expr $( expr $RANDOM % $digitsLength ) );
                passwd="${passwd}${digits[$tabElement]}";;
            2)  tabElement=$( expr $( expr $RANDOM % $bLettersLength ) );
                passwd="${passwd}${bLetters[$tabElement]}";;
            3)  tabElement=$( expr $( expr $RANDOM % $sLettersLength ) );
                passwd="${passwd}${sLetters[$tabElement]}";;
      esac
    fi
    i=$(expr $i + 1);
    previousTabNumber=$tabNumber;
  done

echo "Password: $passwd";
