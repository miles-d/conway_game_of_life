class Cell
  constructor: (@x, @y) ->

  is_alive: (world) ->
    neighbours_count = world.count_neighbours(this)
    if neighbours_count == 2 and !@was_alive(world)
      return false
    neighbours_count >= 2 and neighbours_count < 4

  was_alive: (world) ->
    world.was_cell_alive(this)

module.exports.Cell = Cell
