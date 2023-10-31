git clone https://github.com/sequelize/sequelize.git sequelize
git clone https://github.com/videojs/video.js.git videojs
git clone https://github.com/avajs/ava ava
git clone https://github.com/carbon-app/carbon.git carbon

mkdir artifacts-$MATRIX_OS
mkdir artifacts-$MATRIX_OS/sequelize
mkdir artifacts-$MATRIX_OS/videojs
mkdir artifacts-$MATRIX_OS/ava
mkdir artifacts-$MATRIX_OS/carbon

cdxgen -p -t javascript --deep -o artifacts-$MATRIX_OS/sequelize/sequelize-bom-$MATRIX_OS.json sequelize
cdxgen -p -t javascript --deep -o artifacts-$MATRIX_OS/videojs/videojs-bom-$MATRIX_OS.json videojs
cdxgen -p -t javascript --deep -o artifacts-$MATRIX_OS/ava/ava-bom-$MATRIX_OS.json ava
cdxgen -p -t javascript --deep -o artifacts-$MATRIX_OS/carbon/carbon-bom-$MATRIX_OS.json carbon

evinse -p -i artifacts-$MATRIX_OS/sequelize/sequelize-bom-$MATRIX_OS.json -o artifacts-${{ matrix.os}}/sequelize/sequelize-evinse-$MATRIX_OS.json -l javascript --with-reachables sequelize
evinse -p -i artifacts-$MATRIX_OS/videojs/videojs-bom-$MATRIX_OS.json -o artifacts-${{ matrix.os}}/videojs/videojs-evinse-$MATRIX_OS.json -l javascript --with-reachables videojs
evinse -p -i artifacts-$MATRIX_OS/ava/ava-bom-$MATRIX_OS.json -o artifacts-${{ matrix.os}}/ava/ava-evinse-$MATRIX_OS.json -l javascript --with-reachables ava
evinse -p -i artifacts-$MATRIX_OS/carbon/carbon-bom-$MATRIX_OS.json -o artifacts-${{ matrix.os}}/carbon/carbon-evinse-$MATRIX_OS.json -l javascript --with-reachables carbon
