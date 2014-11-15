assert = chai.assert

describe "Hand", ->

  it "should count aces as 11 unless hand total is greater than 21", ->
    collection = new Deck()
    hand = new Hand [
      new Card
        rank: 1
        suit: Math.floor(card / 13),
      new Card
        rank: 10
        suit: Math.floor(card / 13)
      ]


    assert.strictEqual @$('.score').text, 21
    hand.hit()
    assert.equal @$('.score').text<=21, true
