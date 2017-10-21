td = require 'testdouble'
should = require 'should'
{Cell} = require '../lib/cell'

class World
  count_neighbours: (cell) ->


describe "Cell", ->
  beforeEach () ->
    FakeWorld = td.constructor(World)
    @world = new FakeWorld
    @cell = new Cell(@world, 0, 0)

  it "dies if it has fewer than 2 neighbours, like 0", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(0)
    should(@cell.is_alive()).be.equal false

  it "dies if it has fewer than 2 neighbours, like 1", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(1)
    should(@cell.is_alive()).be.equal false

  it "lives if it has 2 neighbours", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(2)
    should(@cell.is_alive()).be.equal true

  it "lives if it has 3 neighbours", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(3)
    should(@cell.is_alive()).be.equal true

  it "lives if it has 4 or more neighbours", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(4)
    should(@cell.is_alive()).be.equal false
