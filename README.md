# passwordg - PASSWORD Generator

__passwordg__ - prosty generator haseł napisany przy pomocy języka skryptów powłoki BASH.

Instalacja:

1. git clone https://github.com/xf0r3m/passwordg.git
2. cd _passwordg_
3. chmod +x _passwordg.sh_

Użycie:

__UWAGA! Używać pliku passwordg-stable.sh__

```
 $ ./passwordg-stable.sh [-grupa znaków hasła] <długość hasła>
```

Grupy znaków hasła:

* `-d` - cyfry
* `-l` - małe litery
* `-s` - znaki specjalne
* `-u` - wielkie litery

Grupy można ze sobą łączyć w jedyn przełączniku np. `-dlsu`.
