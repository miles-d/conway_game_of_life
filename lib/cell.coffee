class Cell
  constructor: (@world, @x, @y) ->

  is_alive: ->
    neighbours_count = @world.count_neighbours(this)
    neighbours_count >= 2 and neighbours_count < 4

module.exports.Cell = Cell
