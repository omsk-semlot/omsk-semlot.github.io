#!/bin/bash

# Просто собираем сайт, локально.

stack install

stack exec omsk-semlot rebuild

# После этого в корне репозитория смотрим в каталог _site.
