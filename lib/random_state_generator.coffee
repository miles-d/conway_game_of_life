class RandomStateGenerator
  generate: (width) ->
    state = []
    for x in [0..width-1]
      state[x] = []
      for y in [0..width-1]
        state[x][y] = Math.floor(Math.random() * 2)
    state

module.exports.RandomStateGenerator = RandomStateGenerator
