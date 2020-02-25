#!/bin/sh
rm lcov.info
~/.luarocks/bin/busted --coverage --shuffle .
~/.luarocks/bin/luacov -r lcov LibClassicSpecs
mv luacov.report.out lcov.info # for vscode coverage-gutters plugin
rm luacov.stats.out
