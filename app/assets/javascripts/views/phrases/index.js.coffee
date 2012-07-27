class Hangman.Views.PhrasesIndex extends Backbone.View
  template: JST['phrases/index']

  events:
    'submit #new-phrase': 'createPhrase'

  initialize: ->
    @collection.on('reset', @render)
    @collection.on('add', @appendPhrase)

  render: =>
    $(@el).html(@template())
    @collection.each(@appendPhrase)
    this

  appendPhrase: (phrase) =>
    view = new Hangman.Views.Phrase(model: phrase)
    @$('#phrases').append(view.render().el)

  createPhrase: (event) ->
    event.preventDefault()
    attributes = content: $('#new-phrase-content').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new-phrase')[0].reset()
      error: @handleError

  handleError: (phrase, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
