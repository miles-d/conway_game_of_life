td = require 'testdouble'
should = require 'should'
{Cell} = require '../lib/cell'
{World} = require '../lib/world'

describe "Cell", ->
  beforeEach () ->
    FakeWorld = td.constructor(World)
    @world = new FakeWorld
    @cell = new Cell(0, 0)

  it "dies if it has fewer than 2 neighbours, like 0", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(0)
    should(@cell.is_alive(@world)).be.equal false

  it "dies if it has fewer than 2 neighbours, like 1", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(1)
    should(@cell.is_alive(@world)).be.equal false

  it "lives if it has 2 neighbours and was already alive", ->
    td.when(@world.was_cell_alive(@cell)).thenReturn true
    td.when(@world.count_neighbours(@cell)).thenReturn(2)
    should(@cell.is_alive(@world)).be.equal true

  it "does not live if it has 2 neighbours and was already dead", ->
    td.when(@world.was_cell_alive(@cell)).thenReturn false
    td.when(@world.count_neighbours(@cell)).thenReturn(2)
    should(@cell.is_alive(@world)).be.equal false

  it "lives if it has 3 neighbours", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(3)
    should(@cell.is_alive(@world)).be.equal true

  it "lives if it has 4 or more neighbours", ->
    td.when(@world.count_neighbours(@cell)).thenReturn(4)
    should(@cell.is_alive(@world)).be.equal false
