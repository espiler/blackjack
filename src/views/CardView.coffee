class window.CardView extends Backbone.View
  className: 'card'
  tagName: 'span'

  template: _.template '<img src = "src/imgs/cards/<%= rankName %><%= suitName %>.png"></img>'
  templateBack: _.template '<img src = "src/imgs/cards/back.png"></img>'

  initialize: ->
    @render()
    @model.on 'change:revealed', =>
      @render()

  render: ->
    @$el.children().detach()
    if (@model.get 'revealed') is true
      @$el.html @template @model.attributes
    else
      @$el.html @templateBack @model.attributes

    @$el.addClass 'covered' unless @model.get 'revealed'

