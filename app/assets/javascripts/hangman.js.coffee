window.Hangman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Hangman.Routers.Words
    Backbone.history.start(pushState: true)

$(document).ready ->
  Hangman.init()
