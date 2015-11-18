{-
    Модуль, отвечающий за формирование страницы со ссылками на сторонние ресурсы.
    https://github.com/omsk-semlot/omsk-semlot.github.io
    Все права принадлежат Никитину Льву
-}

{-# LANGUAGE OverloadedStrings #-}

module Links (
    createPageWithExternalLinks
) where

import Misc                 (TagsReader)
import Control.Monad.Reader
import Hakyll

-- Формируем страницу с внешними ссылками на всякие полезные вещи.
createPageWithExternalLinks :: TagsReader
createPageWithExternalLinks = do
    lift $ create ["links.html"] $ do
        route idRoute
        compile $ do
            let linksContext = mconcat [ constField "linksTitle" "Ссылки"
                                       , constField "title" "Ссылки"
                                       , defaultContext
                                       ]

            makeItem "" >>= loadAndApplyTemplate "templates/links.html" linksContext
                        >>= loadAndApplyTemplate "templates/default.html" linksContext
                        >>= relativizeUrls
    return ()
