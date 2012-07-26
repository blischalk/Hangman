class Hangman.Views.WordsIndex extends Backbone.View
  template: JST['words/index']

  events:
    'submit #new-word': 'createWord'

  initialize: ->
    @collection.on('reset', @render)
    @collection.on('add', @appendWord)

  render: =>
    $(@el).html(@template())
    @collection.each(@appendWord)
    this

  appendWord: (word) =>
    view = new Hangman.Views.Word(model: word)
    @$('#words').append(view.render().el)

  createWord: (event) ->
    event.preventDefault()
    attributes = title: $('#new-word-title').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new-word')[0].reset()
      error: @handleError

  handleError: (word, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
