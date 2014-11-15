assert = chai.assert

describe "deck constructor", ->

  it "should create a 52 card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52
