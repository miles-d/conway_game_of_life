td = require 'testdouble'
should = require 'should'
{StateVisualizer} = require '../lib/state_visualizer'

describe "StateVisualizer", ->
  beforeEach () ->
    @subject = new StateVisualizer

  it "prints the state in ASCII", ->
    state = [
      [1, 0, 0, 0, 0]
      [0, 1, 0, 0, 0]
      [0, 0, 1, 0, 0]
      [0, 0, 0, 1, 0]
      [0, 0, 0, 0, 1]
    ]

    formatted = """O - - - -
                   - O - - -
                   - - O - -
                   - - - O -
                   - - - - O
                """
    should(@subject.format(state)).be.equal(formatted)
