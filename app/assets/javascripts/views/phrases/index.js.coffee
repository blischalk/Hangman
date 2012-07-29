class Hangman.Views.PhrasesIndex extends Backbone.View
  template: JST['phrases/index']

  events:
    'submit #guess': 'submitGuess'

  submitGuess: (e) ->
    e.preventDefault()
    @checkGuess($('#letter').val())
    $('#guess')[0].reset()

  checkGuess: (guess) ->
    for char in Hangman.phrase.get('content')
      if char == guess
        alert char + ' is in the phrase'

  initialize: ->
    @collection.on('reset', @render)

  render: =>
    $(@el).html(@template())
    @addWords()
    this

  addWords: ->
    $word = $('<div class="word"></div>')
    for char in Hangman.phrase.get('content')
      if char != ' '
        $letter = '<div class="char letter">' + char + '</div>'
        $word.append($letter)
      else
        $word = $('<div class="word"></div>')
      @$('#phrase').append($word)
    @$('#phrase').fadeIn('slow')
