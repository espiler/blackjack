class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

    # @set 'card1', new Card
    #     rank: 1
    #     suit: 1

    # @set 'card2', new Card
    #     rank: 6
    #     suit: 1


  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true
  # dealDealer: -> new Hand [@get 'card1', @get 'card2'], @, true




