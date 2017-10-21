{Game} = require './lib/game'
{StateVisualizer} = require './lib/state_visualizer'
{RandomStateGenerator} = require './lib/random_state_generator'
fs = require('fs')

# run and write to text files

size = process.argv[2] or 30
number_of_generations = process.argv[3] or 99
state = new RandomStateGenerator().generate(size)

filename_for_generation = (count) ->
  filename = '' + counter
  while filename.length < 3
    filename = '0' + filename
  filename += '.txt'

game = new Game(state)
visualizer = new StateVisualizer
counter = 0
for _ in [0..number_of_generations]
  formatted_state = visualizer.format(game.state)
  filename = filename_for_generation(counter)
  fs.writeFileSync("out/#{filename}", formatted_state)
  game.tick()
  counter += 1
