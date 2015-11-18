{-
    Модуль, отвечающий за формирование страницы со встроенной страницей google групп.
    https://github.com/omsk-semlot/omsk-semlot.github.io
    Все права принадлежат Никитину Льву
-}

{-# LANGUAGE OverloadedStrings #-}

module MailingList (
    createMailingListFrontend
) where

import Misc                 (TagsReader)
import Control.Monad.Reader
import Hakyll

-- Формируем страницу с внешними ссылками на всякие полезные вещи.
createMailingListFrontend :: TagsReader
createMailingListFrontend = lift $
    create ["maillist.html"] $ do
      route idRoute
      compile $ do
          let listContext = mconcat [ constField "title" "Список рассылки"
                                    , defaultContext
                                    ]

          makeItem "" >>= loadAndApplyTemplate "templates/mailing.html" listContext
                      >>= loadAndApplyTemplate "templates/default.html" listContext
                      >>= relativizeUrls
