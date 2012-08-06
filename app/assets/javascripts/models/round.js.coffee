class Hangman.Models.Round extends Backbone.Model
  url: "api/hangman/round"

  newRound: (view)->
    model = @
    options = {
      type: "post"
      data:
        # Not sure why we have to use $.param here...
        jQuery.param({newRound: "true"})
      url: model.url
      dataType: 'json'
      success: (resp, status, xhr) ->
        view.responseText = resp
        view.trigger('newRound')
    }
    return (@.sync || Backbone.sync).call(@, 'guess', @, options)
