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

    (@get 'dealerHand').on 'busted', =>
      @trigger 'playerWins'

    (@get 'dealerHand').on 'dealerWins', =>
      @trigger 'dealerWins'

    (@get 'dealerHand').on 'compareHands', =>
      @compareHands()

    null


  compareHands: ->
    playerScore = (@get 'playerHand').correctScore()
    dealerScore = (@get 'dealerHand').correctScore()

    if playerScore > dealerScore
      @trigger 'playerWins', @
    if dealerScore > playerScore
      @trigger 'dealerWins', @
    if dealerScore == playerScore
      @trigger 'push', @
