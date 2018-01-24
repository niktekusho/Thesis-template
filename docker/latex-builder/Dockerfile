# Build Step 1: install git and clone https://github.com/maphy-psd/texliveonfly 

FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/maphy-psd/texliveonfly

RUN mv ./texliveonfly/texliveonfly.py /usr/local/bin && chmod +x /usr/local/bin/texliveonfly.py

# Build Step 2: install texlive (and so on) and copy over texliveonfly

FROM debian:stretch

VOLUME /latexdocs

COPY --from=0 /usr/local/bin/texliveonfly.py /usr/local/bin/texliveonfly.py

RUN apt-get update && apt-get install -y --no-install-recommends \
  biber \
  cm-super \
  nano \
  python \
  texlive \
  texlive-bibtex-extra \
  texlive-generic-extra \
  texlive-lang-italian \
  texlive-latex-extra \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /latexdocs
