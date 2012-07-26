class Hangman.Routers.Words extends Backbone.Router
  routes:
    '': 'index'
    'words/:id': 'show'

  initialize: ->
    @collection = new Hangman.Collections.Words()
    @collection.fetch()

  index: ->
    view = new Hangman.Views.WordsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id)->
    alert "Word #{id}"
