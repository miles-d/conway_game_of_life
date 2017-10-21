td = require 'testdouble'
should = require 'should'
{World} = require '../lib/world'
{Cell} = require '../lib/cell'

describe "World", ->
  describe "count_neighbours", ->
    it "counts neighbours of a cell, part 1", ->
      world = new World([
        [1, 1, 1]
        [1, 1, 1]
        [1, 1, 1]
      ])
      cell = new Cell(1, 1)
      should(world.count_neighbours(cell)).be.equal(8)

    it "counts neighbours of a cell, part 2", ->
      world = new World([
        [0, 0, 0]
        [1, 1, 1]
        [0, 0, 0]
      ])
      should(world.count_neighbours(new Cell(0, 0))).be.equal(2)
      should(world.count_neighbours(new Cell(0, 1))).be.equal(3)
      should(world.count_neighbours(new Cell(0, 2))).be.equal(2)

    it "knows if cell was alive, part 1", ->
      world = new World([
        [1, 1, 1]
        [0, 0, 0]
        [0, 0, 0]
      ])
      cell = new Cell(1, 1)
      should(world.was_cell_alive(cell)).be.equal(false)

    it "knows if cell was alive, part 2", ->
      world = new World([
        [1, 1, 1]
        [0, 0, 0]
        [0, 0, 0]
      ])
      cell = new Cell(0, 2)
      should(world.was_cell_alive(cell)).be.equal(true)
