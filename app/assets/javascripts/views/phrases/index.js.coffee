class Hangman.Views.PhrasesIndex extends Backbone.View
  template: JST['phrases/index']

  events:
    'submit #guess': 'submitGuess'

  submitGuess: (e) ->
    e.preventDefault()
    @checkGuess($('#letter').val())
    $('#guess')[0].reset()

  checkGuess: (guess) ->
    # store the index locations where the guess was found
    indexes = []
    # Our display logic does not use spaces as words are separated into divs
    # so we must remove spaces
    for char, index in Hangman.phrase.get('content').replace(/\s+/g, '').split('')
      if char == guess
        indexes.push(index)
    # If indexes is a blank array the guess was wrong
    # and we need to hang the man
    if indexes.length == 0
      @hangMan()
      if Hangman.wrongAnswers == 7
        @gameOver()
      return
    else
    # otherwise we need to fill in the appropriate letters on the gameboard
      @addLetter guess, index for index in indexes

  addLetter: (char, index) ->
    # get all the letter divs
    $letterContainers = $('.letter')
    # add the guessed character into the containers
    $($letterContainers[index]).html("<p>" + char + "</p>")

  hangMan: ->
    # show body before left arm
    index = Hangman.wrongAnswers
    index = 3 if Hangman.wrongAnswers is 2
    index = 2 if Hangman.wrongAnswers is 3
    # display appendages
    $('#man').children().eq(index).css({'opacity': 1.0})
    Hangman.wrongAnswers++

  gameOver: ->
    alert 'You have lost :(. Re-setting'
    $('#man').children().each ->
      $(@).css({'opacity': 0.0})
    @resetGame()

  resetGame: ->
    @collection.fetch()


  initialize: ->
    @collection.on('reset', @render)

  render: =>
    $(@el).html(@template())
    @addWords()
    this

  addWords: ->
    # @TODO: move this html into a template of some sort
    for word, val of $('#container').data('phrase-indicies')
      $word = $('<div class="word"></div>')
      for correct in val
        if correct != 0 then letter = correct else letter = ''
        $letter = '<div class="char letter">' + letter + '</div>'
        $word.append($letter)
      @$('#phrase').append($word)
    @$('#phrase').fadeIn('slow')
