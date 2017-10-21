td = require 'testdouble'
should = require 'should'
{Game} = require '../lib/game'

describe "Game", ->
  it "changes state on tick, part 1", ->
    old_state = [
      [1, 1, 1],
      [0, 0, 0],
      [0, 0, 0],
    ]

    next_state = [
      [0, 1, 0],
      [0, 1, 0],
      [0, 0, 0],
    ]
    @game = new Game(old_state)
    @game.tick()
    should(@game.state).be.deepEqual(next_state)

  it "changes state on tick, part 2", ->
    old_state = [
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0],
    ]

    next_state = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
    ]
    @game = new Game(old_state)
    @game.tick()
    should(@game.state).be.deepEqual(next_state)
