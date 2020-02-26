#!/bin/sh
set -e
luarocks install --local busted
luarocks install --local luacov
luarocks install --local luacov-reporter-lcov

# TODO: use the mainline release.sh once the Mac fix is merged
curl -s https://raw.githubusercontent.com/tstirrat/BigWigsMods-packager/ts-macos-grep/release.sh | bash -s -- -d -z

cp -r .release/LibClassicSpecs/Lib .
