#!/bin/bash

DIR="./output"	# modificare per scegliere il nome della cartella di destinazione
NAME="relazione-finale"		# modificare per scegliere il nome del file di origine (.tex)

if [ ! -d $DIR ];
  then
    mkdir $DIR;
fi

echo --------------------
echo - Inizializzazione -
echo --------------------

pdflatex -output-directory=$DIR $NAME
biber $DIR/$NAME
makeindex -s ./$DIR/$NAME.ist -t ./$DIR/$NAME.glg -o $DIR/$NAME.gls ./$DIR/$NAME.glo
makeindex -s ./$DIR/$NAME.ist -t ./$DIR/$NAME.alg -o ./$DIR/$NAME.acr ./$DIR/$NAME.acn

# Due volte because Latex

pdflatex -output-directory=$DIR $NAME
biber $DIR/$NAME
makeindex -s ./$DIR/$NAME.ist -t ./$DIR/$NAME.glg -o $DIR/$NAME.gls ./$DIR/$NAME.glo
makeindex -s ./$DIR/$NAME.ist -t ./$DIR/$NAME.alg -o ./$DIR/$NAME.acr ./$DIR/$NAME.acn

echo -------------------------
echo - Generazione Documento -
echo -------------------------

pdflatex -output-directory=$DIR $NAME
pdflatex -output-directory=$DIR $NAME
# 
# echo ---------------------------------
# echo - Pulisco e poi apro il file... -
# echo ---------------------------------
# 
# rm $DIR/*.acn $DIR/*.aux $DIR/*.bbl $DIR/*.bcf $DIR/*.glo
# rm $DIR/*.ist $DIR/*.lof $DIR/*.lot $DIR/*.run.xml $DIR/*.toc
# Per mantenere i log commentare la linea seguente
# rm $DIR/*.blg  $DIR/*.log

# open $DIR/$NAME.pdf

echo ---------------------------- END -----------------------------
