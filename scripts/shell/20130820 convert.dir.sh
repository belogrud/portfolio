#!/bin/bash

#inputdir=/var/smb/temp/test
#inputdir=/var/smb/home/belogrud/sounds.other
#inputdir=/var/smb/home/belogrud/archives.soft
inputdir=/var/smb/home/belogrud/sound.selected
#inputdir=/var/smb/home/belogrud/test
outprefix=translate

#find $i -follow -mindepth 0 -type f -perm -'-rw-r--r--'

# Сначала создём структуру каталогов с изменённой кодировкой.
echo "Making NEW directoty structure $inputdir.$outprefix ..."
# К сожалению приходится пробелы в именах, найденных find заменять на подчёркивания (потом его убирать).
# Иначе переменная n примет поочереди значения найденных слов свесто всего предложения.
# Кажется я решил эту проблему в другом скрипте нужно писать "`find ...`" но здесь ещё не опробовал!!!
for n in `find $inputdir -follow -mindepth 0 -type d | sed 's/ /=~^~=/g'`; do
    #    let "i += 1"
    #    echo $i

    fulldirmod=`echo "$n" | sed -e 's/\// \\\ \/ /g' | sed -e 's/ //g'`
    inputdirmod=`echo "$inputdir" | sed -e 's/\// \\\ \/ /g' | sed -e 's/ //g'`
    #    echo $fulldirmod ... $inputdirmod

# К сожалению такую строчку не удаётся потом выполнить из этого скрипта. Баш воспринимает её как строку.
# Не помогают ни фигурные ни круглые скобики.
#    outdir1="echo \"$n\" | sed -e \"s/$inputdirmod/$inputdirmod.$outprefix/\""

    var1="sed -e s/$inputdirmod/$inputdirmod.$outprefix/"
    #    echo $var1

    outdir=`echo "$n" | $var1 | sed 's/=~^~=/ /g'`
    #    echo "$outdir"

    echo "$outdir" | iconv -f KOI8-R -t WINDOWS-1251 -
    mkdir -p "`echo "$outdir" | iconv -f KOI8-R -t WINDOWS-1251 -`"
done

# Потом копируем в новую структуру каталогов файлы с изменённой кодировкой.
echo "Copying files to NEW directoty structure $inputdir.$outprefix ..."
# К сожалению приходится пробелы в именах, найденных find заменять на подчёркивания (потом его убирать).
# Иначе переменная n примет поочереди значения найденных слов свесто всего предложения.
for n in `find $inputdir -follow -mindepth 0 -type f | sed 's/ /=~^~=/g'`; do

    fulldirmod=`echo "$n" | sed -e 's/\// \\\ \/ /g' | sed -e 's/ //g'`
    inputdirmod=`echo "$inputdir" | sed -e 's/\// \\\ \/ /g' | sed -e 's/ //g'`
    #    echo $fulldirmod ... $inputdirmod

    var1="sed -e s/$inputdirmod/$inputdirmod.$outprefix/"
    #    echo $var1

    outdir=`echo "$n" | $var1 | sed 's/=~^~=/ /g'`
    #    echo $outdir

    echo "$outdir" | iconv -f KOI8-R -t WINDOWS-1251 -
#    cp -f "`echo "$n" | sed 's/=~^~=/ /g'`" "`echo "$outdir" | iconv -f KOI8-R -t WINDOWS-1251 -`"
    mv -f "`echo "$n" | sed 's/=~^~=/ /g'`" "`echo "$outdir" | iconv -f KOI8-R -t WINDOWS-1251 -`"

done
