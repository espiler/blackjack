# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'dealerPlay', =>
      (@get 'dealerHand').dealerFlip()
    (@get 'playerHand').on 'busted', =>
      @trigger 'busted'
    null
