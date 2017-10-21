td = require 'testdouble'
should = require 'should'
{RandomStateGenerator} = require '../lib/random_state_generator'

describe "RandomStateGenerator", ->
  it "generates state with given width", ->
    subject = new RandomStateGenerator
    result = subject.generate 3
    should(result.length).be.equal 3
    should(result[0].length).be.equal 3
    should(result[1].length).be.equal 3
    should(result[2].length).be.equal 3
