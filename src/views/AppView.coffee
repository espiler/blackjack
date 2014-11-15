class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button toDisable">Hit</button> <button class="stand-button toDisable">Stand</button><h1 class="winner"></h1>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <button class="newGame">Start New Hand</button>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').playerStand()
    'click .newGame' : ->
      @$el.remove()
      new AppView(model: new App()).$el.appendTo 'body'


  initialize: ->

    @render()
    @model.on 'busted', =>
      $('.toDisable').prop 'disabled', true
      @model.get('dealerHand').dealerEndsBustedGame()
    @model.on 'dealerWins', =>
      $('.winner').text 'Dealer Wins Wings!!'
    @model.on 'playerWins', =>
      $('.winner').text 'Player Wins Wings!!'
    @model.on 'push', =>
      $('.winner').text 'Everybody Gets Wings!!!!'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

