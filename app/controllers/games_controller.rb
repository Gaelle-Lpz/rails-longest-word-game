class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << (('a'..'z').to_a.sample.capitalize!) }
  end

  def score
  end
end
