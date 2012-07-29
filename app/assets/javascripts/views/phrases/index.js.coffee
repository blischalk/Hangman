class Hangman.Views.PhrasesIndex extends Backbone.View
  template: JST['phrases/index']

  events:
    'submit #guess': 'submitGuess'

  submitGuess: (e) ->
    e.preventDefault()
    @checkGuess($('#letter').val())
    $('#guess')[0].reset()

  checkGuess: (guess) ->
    index = 0
    for char in Hangman.phrase.get('content')
      if char == guess
        @addLetter(char, index)
      else
        @hangMan()
        return
      if char != ' '
        index++

  addLetter: (char, index) ->
    $letterContainers = $('.letter')
    $($letterContainers[index]).html("<p>" + char + "</p>")

  wrongAnswers: 0

  hangMan: ->
    # show body before left arm
    index = @wrongAnswers
    index = 3 if @wrongAnswers is 2
    index = 2 if @wrongAnswers is 3
    $('#man').children().eq(index).css({'opacity': 1.0})
    @wrongAnswers++

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
        $letter = '<div class="char letter"></div>'
        $word.append($letter)
      else
        $word = $('<div class="word"></div>')
      @$('#phrase').append($word)
    @$('#phrase').fadeIn('slow')
