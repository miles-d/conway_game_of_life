{Game} = require './lib/game'
{StateVisualizer} = require './lib/state_visualizer'
{RandomStateGenerator} = require './lib/random_state_generator'

# run continuously

size = process.argv[2] or 30
state = new RandomStateGenerator().generate(size)

game = new Game(state)
visualizer = new StateVisualizer
showing = () ->
  formatted_state = visualizer.format(game.state)
  console.log(formatted_state, '\n')
  game.tick()
  setTimeout(showing, 200)
showing()
