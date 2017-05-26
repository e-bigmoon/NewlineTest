module Handler.Foo where

import Import

bar :: Widget
bar = do
  bar <- newIdent

  [whamlet|
      <div ##{bar}>
        <h2>
          This is bar.
  
        ^{boo}
  |]

boo :: Widget
boo = do
  boo <- newIdent

  [whamlet|
      <div ##{boo}>
        <h3>
          This is boo.
  
        <button type="button">
          Boo 1!
        <button type="button">
          Boo 2!        
        <button type="button">
          Boo 3!
  |]

getFooR :: Handler Html
getFooR = do
  defaultLayout $ do
    foo <- newIdent

    toWidget
      [cassius|
        section##{foo}
          width: 500px
          height: 500px
      |]

    [whamlet|
      $newline never
        <section ##{foo}>
          <h1>
            This is foo.
            
          ^{bar}
    |]
