td = require 'testdouble'
should = require 'should'
# {World} = require '../lib/world'
{Cell} = require '../lib/cell'

class World
  constructor: (@state) ->

  count_neighbours: (cell) ->
    neighbouring_x = [cell.x - 1, cell.x, cell.x + 1]
      .filter (x) ->
        x >= 0
    neighbouring_y = [cell.y - 1, cell.y, cell.y + 1]
      .filter (y) ->
        y >= 0

    counter = 0
    maybe_increment = (x, y) =>
      if x == cell.x and y == cell.y
        return
      if @state[x][y] == 1
        counter +=1

    for x in neighbouring_x
      for y in neighbouring_y
        maybe_increment x, y
    counter

describe "World", ->
  describe "count_neighbours", ->
    it "counts neighbours of a cell, part 1", ->
      world = new World([
        [1, 1, 1]
        [1, 1, 1]
        [1, 1, 1]
      ])
      cell = new Cell(world, 1, 1)
      should(world.count_neighbours(cell)).be.equal(8)

    it "counts neighbours of a cell, part 2", ->
      world = new World([
        [1, 0, 0]
        [1, 0, 0]
        [0, 0, 0]
      ])
      cell = new Cell(world, 0, 0)
      should(world.count_neighbours(cell)).be.equal(1)
