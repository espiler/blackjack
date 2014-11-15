class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @set 'busted', false
    null

  hit: ->
    debugger;
    @add(@deck.pop())
    if @correctScore() > 21
      @trigger 'busted', @
      @set 'busted', true
    null

  playerStand: ->
    @trigger 'dealerPlay', @

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  correctScore: ->
    if @scores()[1] > 21 then @scores()[0] else @scores()[1]


  dealerFlip: ->
    @at(0).flip()
    @dealerPlay()

  dealerEndsBustedGame: ->
    @at(0).flip()


  dealerPlay: ->
    @hit() until @correctScore() >= 17
    if @correctScore() == 17 and @minScore() == 7
      @hit()
      @dealerPlay()
    null

  busted: false





