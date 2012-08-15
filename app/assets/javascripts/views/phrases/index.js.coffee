class Hangman.Views.PhrasesIndex extends Backbone.View
  template: JST['phrases/index']

  events:
    'submit #guess': 'submitGuess'

  initialize: ->
    @.on('guessResponse', @displayUpdate)
    @.on('newRound', @setupNewRound)
    @.on('cleanUp', @cleanUp)

  cleanUp: ->
    if @gameOver()
      @getNewRound()
      @displayGameOver()
      @resetMan()

  setupNewRound: ->
    $('#container').data('round-data', @.responseText)
    @addWords()

  resetMan: ->
    $('#man').children().each ->
      $(this).css({'opacity': 0.0})

  displayGameOver: ->
    alert 'Game Over :(' 

  getNewRound: ->
    new Hangman.Models.Round().newRound(@)

  gameOver: ->
    unguessed = 0
    $('.letter').each ->
      unguessed++ if $(this).text() == ''
    return true if unguessed == 0 || $('#container').data('round-data').incorrect_answers >= 7

  submitGuess: (e) ->
    e.preventDefault()
    new Hangman.Models.Phrase().guess($('#letter').val(), @)
    $('#guess')[0].reset()

  displayUpdate: ->
    $('#container').data('round-data', @.responseText)
    @hangMan()
    @updateLetters()
    @cleanUp()

  updateLetters: ->
    $letters = $('.letter')
    index = 0
    for word, val of $('#container').data('round-data').phrase_indicies
      for correct in val
        if correct != 0
          $($letters[index]).html(correct)
        index++

  hangMan: ->
    incorrect_answers = $('#container').data('round-data').incorrect_answers
    @displayParts(index, incorrect_answers) for index in [0..incorrect_answers]

  displayParts: (index, incorrect_answers) ->
    return if index == 0
    # show body before left arm
    index = 4 if incorrect_answers is 3
    index = 3 if incorrect_answers is 4
    # display appendages
    $('#man').children().eq(index - 1).css({'opacity': 1.0})
    

  render: =>
    $(@el).html(@template())
    @addWords()
    @hangMan()
    this

  addWords: ->
    $('#phrase').empty()
    # @TODO: move this html into a template of some sort
    for word, val of $('#container').data('round-data').phrase_indicies
      $word = $('<div class="word"></div>')
      for correct in val
        if correct != 0 then letter = correct else letter = ''
        $letter = '<div class="char letter">' + letter + '</div>'
        $word.append($letter)
      @$('#phrase').append($word)
    @$('#phrase').fadeIn('slow')
