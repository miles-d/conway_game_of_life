{World} = require '../lib/world'
{Cell} = require '../lib/cell'

class Game
  constructor: (@state) ->
    @width = @state[0].length - 1

  tick: ->
    world = new World(@state)
    new_state = new Array(@state.length)

    for row in [0..@width]
      new_state[row] = new Array(@state.length)
      for column in [0..@width]
        cell = new Cell(row, column)
        if cell.is_alive(world)
          new_state[row][column] = 1
        else
          new_state[row][column] = 0

    @state = new_state

module.exports.Game = Game
