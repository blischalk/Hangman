class Hangman.Views.PhrasesIndex extends Backbone.View
  template: JST['phrases/index']

  events:
    'submit #guess': 'submitGuess'

  initialize: ->
    @.on('guessResponse', @displayUpdate)

  submitGuess: (e) ->
    e.preventDefault()
    phrase = new Hangman.Models.Phrase()
    phrase.guess($('#letter').val(), @)
    $('#guess')[0].reset()

  displayUpdate: ->
    $('#container').data('round-data', @.responseText)
    @updateLetters()
    @checkGameOver()

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
    # show body before left arm
    index = 3 if incorrect_answers is 2
    index = 2 if incorrect_answers is 3
    # display appendages
    $('#man').children().eq(index).css({'opacity': 1.0})

  render: =>
    $(@el).html(@template())
    @addWords()
    this

  addWords: ->
    # @TODO: move this html into a template of some sort
    for word, val of $('#container').data('round-data').phrase_indicies
      $word = $('<div class="word"></div>')
      for correct in val
        if correct != 0 then letter = correct else letter = ''
        $letter = '<div class="char letter">' + letter + '</div>'
        $word.append($letter)
      @$('#phrase').append($word)
    @$('#phrase').fadeIn('slow')
