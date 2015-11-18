with (import <nixpkgs> {}).pkgs;
let pkg = haskellngPackages.callPackage
            ({ mkDerivation, base, blaze-html, BlogLiterately, containers
             , filepath, hakyll, HTTP, mtl, old-locale, split, stdenv
             }:
             mkDerivation {
               pname = "omsk-semlot";
               version = "0.1.0.0";
               sha256 = "0";
               isLibrary = false;
               isExecutable = true;
               buildDepends = [
                 base blaze-html BlogLiterately containers filepath hakyll HTTP mtl
                 old-locale split
               ];
               homepage = "http://haskell.ru";
               description = "Official site of Omsk Semlot";
               license = stdenv.lib.licenses.unfree;
             }) {};
in
  pkg.env
