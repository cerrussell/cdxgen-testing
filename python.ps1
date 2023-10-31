git clone https://github.com/explosion/spaCy.git spacy
git clone https://github.com/Tautulli/Tautulli.git tautulli
git clone https://github.com/se2p/pynguin.git pynguin
git clone https://github.com/scrapy/scrapy.git scrapy

mkdir artifacts-$MATRIX_OS
mkdir artifacts-$MATRIX_OS/spacy
mkdir artifacts-$MATRIX_OS/tautulli
mkdir artifacts-$MATRIX_OS/pynguin
mkdir artifacts-$MATRIX_OS/scrapy

cdxgen -p -t python --deep -o artifacts-$MATRIX_OS/spacy/spacy-bom-$MATRIX_OS.json spacy
cdxgen -p -t python --deep -o artifacts-$MATRIX_OS/tautulli/tautulli-bom-$MATRIX_OS.json tautulli
cdxgen -p -t python --deep -o artifacts-$MATRIX_OS/pynguin/pynguin-bom-$MATRIX_OS.json pynguin
cdxgen -p -t python --deep -o artifacts-$MATRIX_OS/scrapy/scrapy-bom-$MATRIX_OS.json scrapy

evinse -p -i artifacts-$MATRIX_OS/spacy/spacy-bom-$MATRIX_OS.json -o artifacts-$MATRIX_OS/spacy/spacy-evinse-$MATRIX_OS.json -l python --with-reachables spacy
evinse -p -i artifacts-$MATRIX_OS/tautulli/tautulli-bom-$MATRIX_OS.json -o artifacts-$MATRIX_OS/tautulli/tautulli-evinse-$MATRIX_OS.json -l python --with-reachables tautulli
evinse -p -i artifacts-$MATRIX_OS/pynguin/pynguin-bom-$MATRIX_OS.json -o artifacts-$MATRIX_OS/pynguin/pynguin-evinse-$MATRIX_OS.json -l python --with-reachables pynguin
evinse -p -i artifacts-$MATRIX_OS/scrapy/scrapy-bom-$MATRIX_OS.json -o artifacts-$MATRIX_OS/scrapy/scrapy-evinse-$MATRIX_OS.json -l python --with-reachables scrapy
