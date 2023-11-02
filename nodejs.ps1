git clone https://github.com/sequelize/sequelize.git sequelize
git clone https://github.com/videojs/video.js.git videojs
git clone https://github.com/avajs/ava ava
git clone https://github.com/carbon-app/carbon.git carbon

mkdir artifacts-$env:MATRIX_OS
mkdir artifacts-$env:MATRIX_OS/sequelize
mkdir artifacts-$env:MATRIX_OS/videojs
mkdir artifacts-$env:MATRIX_OS/ava
mkdir artifacts-$env:MATRIX_OS/carbon

if ($env:WITH_EVINSE -eq $true) {
    cdxgen -t javascript --deep -o artifacts-$env:MATRIX_OS/sequelize/sequelize-bom-$env:MATRIX_OS.json sequelize
    cdxgen -t javascript --deep -o artifacts-$env:MATRIX_OS/videojs/videojs-bom-$env:MATRIX_OS.json videojs
    cdxgen -t javascript --deep -o artifacts-$env:MATRIX_OS/ava/ava-bom-$env:MATRIX_OS.json ava
    cdxgen -t javascript --deep -o artifacts-$env:MATRIX_OS/carbon/carbon-bom-$env:MATRIX_OS.json carbon
    evinse -i artifacts-$env:MATRIX_OS/sequelize/sequelize-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/sequelize/sequelize-evinse-$env:MATRIX_OS.json -l javascript --with-reachables sequelize
    evinse -i artifacts-$env:MATRIX_OS/videojs/videojs-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/videojs/videojs-evinse-$env:MATRIX_OS.json -l javascript --with-reachables videojs
    evinse -i artifacts-$env:MATRIX_OS/ava/ava-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/ava/ava-evinse-$env:MATRIX_OS.json -l javascript --with-reachables ava
    evinse -i artifacts-$env:MATRIX_OS/carbon/carbon-bom-$env:MATRIX_OS.json -o artifacts-$env:MATRIX_OS/carbon/carbon-evinse-$env:MATRIX_OS.json -l javascript --with-reachables carbon
}
else {
    cdxgen -t javascript -o artifacts-$env:MATRIX_OS/sequelize/sequelize-bom-$env:MATRIX_OS.json sequelize
    cdxgen -t javascript -o artifacts-$env:MATRIX_OS/videojs/videojs-bom-$env:MATRIX_OS.json videojs
    cdxgen -t javascript -o artifacts-$env:MATRIX_OS/ava/ava-bom-$env:MATRIX_OS.json ava
    cdxgen -t javascript -o artifacts-$env:MATRIX_OS/carbon/carbon-bom-$env:MATRIX_OS.json carbon
}


