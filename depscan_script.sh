#!/usr/bin/bash
source $SDKMAN_DIR/bin/sdkman-init.sh

sdk install java 8.0.392-zulu
sdk install java 21.0.1-zulu

mkdir /home/runner/work/artifacts/ /home/runner/work/src_repos
cd /home/runner/work/artifacts/
mkdir java-sec-code piggymetrics nodegoat juiceshop
cd $GITHUB_WORKSPACE

git clone https://github.com/sqshq/piggymetrics.git /home/runner/work/src_repos/piggymetrics
cd /home/runner/work/src_repos/piggymetrics
sdk use java 8.0.392-zulu
mvn -B -ntp package -DskipTests=true
sdk use java 21.0.1-zulu
cdxgen -t java --deep --evidence -o /home/runner/work/src_repos/piggymetrics/bom.json /home/runner/work/src_repos/piggymetrics


git clone https://github.com/juice-shop/juice-shop.git /home/runner/work/src_repos/juiceshop
cd /home/runner/work/src_repos/juiceshop
npm install
cdxgen -t javascript --deep --evidence -o /home/runner/work/src_repos/juiceshop/bom.json /home/runner/work/src_repos/juiceshop


git clone https://github.com/OWASP/nodegoat.git /home/runner/work/src_repos/nodegoat
cd /home/runner/work/src_repos/nodegoat
npm install
cdxgen -t javascript --deep --evidence -o /home/runner/work/src_repos/nodegoat/bom.json /home/runner/work/src_repos/nodegoat


git clone https://github.com/ngcloudsec/java-sec-code.git /home/runner/work/src_repos/java-sec-code
cd /home/runner/work/src_repos/java-sec-code
sdk use java 8.0.392-zulu
mvn -B -ntp package -DskipTests=true
sdk use 21.0.1-zulu
cdxgen -t java --deep --evidence -o /home/runner/work/src_repos/java-sec-code/bom.json /home/runner/work/src_repos/java-sec-code


cp depscan/contrib/csaf.toml /home/runner/work/src_repos/java-sec-code/csaf.toml
cp depscan/contrib/csaf.toml /home/runner/work/src_repos/nodegoat/csaf.toml
cp depscan/contrib/csaf.toml /home/runner/work/src_repos/piggymetrics/csaf.toml
cp depscan/contrib/csaf.toml /home/runner/work/src_repos/juiceshop/csaf.toml


cd /home/runner/work/depscan
python3 pip install -r contrib/requirements.txt
python3 depscan/cli.py --csaf --no-banner --profile research --no-error --bom /home/runner/work/src_repos/java-sec-code/bom.json -o /home/runner/work/artifacts/depscan-java-sec-code.json --reports-dir /home/runner/work/artifacts/java-sec-code

cp /home/runner/work/src_repos/java-sec-code/bom.json /home/runner/work/artifacts/java-sec-code/bom.json

python3 depscan/cli.py --csaf --no-banner --profile research --no-error --bom /home/runner/work/src_repos/piggymetrics/bom.json -o /home/runner/work/artifacts/depscan-piggymetrics.json --reports-dir /home/runner/work/artifacts/piggymetrics

cp /home/runner/work/src_repos/piggymetrics/bom.json /home/runner/work/artifacts/piggymetrics/bom.json

python3 depscan/cli.py --csaf --no-banner --profile research --no-error --bom /home/runner/work/src_repos/juiceshop/bom.json -o /home/runner/work/artifacts/depscan-juiceshop.json --reports-dir /home/runner/work/artifacts/juiceshop

cp /home/runner/work/src_repos/juiceshop/bom.json /home/runner/work/artifacts/juiceshop/bom.json

python3 depscan/cli.py --csaf --no-banner --profile research --no-error --bom /home/runner/work/src_repos/nodegoat/bom.json -o /home/runner/work/artifacts/depscan-nodegoat.json --reports-dir /home/runner/work/artifacts/nodegoat

cp /home/runner/work/src_repos/nodegoat/bom.json /home/runner/work/artifacts/nodegoat/bom.json

