git clone https://github.com/explosion/spaCy.git spacy
git clone https://github.com/Tautulli/Tautulli.git tautulli
git clone https://github.com/se2p/pynguin.git pynguin
git clone https://github.com/scrapy/scrapy.git scrapy

mkdir artifacts-$env:MATRIX_OS
mkdir artifacts-$env:MATRIX_OS/spacy
mkdir artifacts-$env:MATRIX_OS/tautulli
mkdir artifacts-$env:MATRIX_OS/pynguin
mkdir artifacts-$env:MATRIX_OS/scrapy

if ($env:WITH_EVINSE -eq $true) {
  cdxgen -p -t python --deep -o artifacts-$env:MATRIX_OS/spacy/spacy-bom-$env:MATRIX_OS.json spacy
  cdxgen -p -t python --deep -o artifacts-$env:MATRIX_OS/tautulli/tautulli-bom-$env:MATRIX_OS.json tautulli
  cdxgen -p -t python --deep -o artifacts-$env:MATRIX_OS/pynguin/pynguin-bom-$env:MATRIX_OS.json pynguin
  cdxgen -p -t python --deep -o artifacts-$env:MATRIX_OS/scrapy/scrapy-bom-$env:MATRIX_OS.json scrapy
  evinse -p -i artifacts-$env:MATRIX_OS/spacy/spacy-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/spacy/spacy-evinse-$env:MATRIX_OS.json -l python --with-reachables spacy
  evinse -p -i artifacts-$env:MATRIX_OS/tautulli/tautulli-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/tautulli/tautulli-evinse-$env:MATRIX_OS.json -l python --with-reachables tautulli
  evinse -p -i artifacts-$env:MATRIX_OS/pynguin/pynguin-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/pynguin/pynguin-evinse-$env:MATRIX_OS.json -l python --with-reachables pynguin
  evinse -p -i artifacts-$env:MATRIX_OS/scrapy/scrapy-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/scrapy/scrapy-evinse-$env:MATRIX_OS.json -l python --with-reachables scrapy
}
else {
  cdxgen -p -t python -o artifacts-$env:MATRIX_OS/spacy/spacy-bom-$env:MATRIX_OS.json spacy
  cdxgen -p -t python -o artifacts-$env:MATRIX_OS/tautulli/tautulli-bom-$env:MATRIX_OS.json tautulli
  cdxgen -p -t python -o artifacts-$env:MATRIX_OS/pynguin/pynguin-bom-$env:MATRIX_OS.json pynguin
  cdxgen -p -t python -o artifacts-$env:MATRIX_OS/scrapy/scrapy-bom-$env:MATRIX_OS.json scrapy
}
