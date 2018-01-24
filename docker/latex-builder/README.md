docker build -t latex-builder .

percorso win: assoluto (tipo docker run -it --mount type=bind,source="C:\Users\nicdalm.SANMARCO\Documents\GitHub\Thesis-template",target=/latexdocs  latex-builder)
docker run -it --mount type=bind,source="$(pwd)"/,target=/latexdocs latex-builder