{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Web.WordPress.API where

import           Data.Proxy                (Proxy (Proxy))
import           Servant.API               ((:<|>) ((:<|>)), (:>), BasicAuth,
                                            BasicAuthData, Get, JSON, Post,
                                            ReqBody, Capture)
import           Servant.Client            (ClientM, client)

import           Web.WordPress.Types.Post  (ListPostsMap, PostMap)
import           Web.WordPress.YoloContent (YoloJSON)

type Posts =
  "posts" :>
  (    ReqBody '[JSON] ListPostsMap :> Get '[JSON, YoloJSON] [PostMap]
  :<|> BasicAuth "wordpress" () :> ReqBody '[JSON] PostMap :> Post '[JSON] PostMap
  :<|> BasicAuth "wordpress" () :> Capture "id" Int :> Get '[JSON] PostMap
  )

postsAPI :: Proxy Posts
postsAPI = Proxy

listPosts :: ListPostsMap -> ClientM [PostMap]
createPost :: BasicAuthData -> PostMap -> ClientM PostMap
getPost :: BasicAuthData -> Int -> ClientM PostMap

(listPosts :<|> createPost :<|> getPost) =
  client postsAPI

