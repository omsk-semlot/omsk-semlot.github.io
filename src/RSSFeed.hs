{-
    Модуль, отвечающий за работу с RSS.
    https://github.com/omsk-semlot/omsk-semlot.github.io
    Все права принадлежат Никитину Льву
-}

{-# LANGUAGE OverloadedStrings #-}

module RSSFeed (
    setupRSSFeed,
) where

import Misc                 (aHost, TagsReader)
import Context              (postContext)
import Control.Monad.Reader
import Hakyll

feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration { feedTitle       = "omsk-semlot"
                                      , feedDescription = "Официальный сайт Омского отделения Межрегионального движения \"Семья, любовь, Отечество\""
                                      , feedAuthorName  = "Никитин Лев"
                                      , feedAuthorEmail = "omsk.semlot@yandex.ru"
                                      , feedRoot        = aHost
                                      }

-- Формируем стандартную RSS-ленту, на основе последних 10 публикаций.
setupRSSFeed :: TagsReader
setupRSSFeed = do
    tagsAndAuthors <- ask
    lift $ create ["feed.xml"] $ do
        route idRoute
        compile $ do
            let feedContext = mconcat [ postContext tagsAndAuthors
                                      , constField "description" ""
                                      ]
            -- Учитываем 10 последних статей.
            last10Posts <- fmap (take 10) . recentFirst =<< loadAll "posts/**"
            renderRss feedConfiguration
                      feedContext
                      last10Posts
    return ()

