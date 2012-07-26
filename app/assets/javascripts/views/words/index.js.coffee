class Hangman.Views.WordsIndex extends Backbone.View
  template: JST['words/index']

  events:
    'submit #new-word': 'createWord'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendWord, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendWord)
    this

  appendWord: (word) ->
    view = new Hangman.Views.Word(model: word)
    $('#words').append(view.render().el)

  createWord: (event) =>
    event.preventDefault()
    @collection.create title: $('#new-word-title').val()
    $('#new-word')[0].reset()
