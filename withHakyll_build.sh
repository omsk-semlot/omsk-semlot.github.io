mkdir dist
set -e
ghc -threaded -o dist/pkg Setup.hs
dist/pkg configure
dist/pkg build
dist/build/omsk-semlot/omsk-semlot build
dist/build/omsk-semlot/omsk-semlot check
