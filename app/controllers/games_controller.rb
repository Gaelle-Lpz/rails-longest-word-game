require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << (('a'..'z').to_a.sample.capitalize!) }
  end

  def score
    player_word = params[:word]
    letters = params[:letters]
    letters = letters.split(' ');
    included?(player_word, letters)
  end

  def included?(player_word, letters)
    player_word.upcase!
    if player_word.chars.all? { |letter| player_word.count(letter) <= letters.count(letter) }
      english_word?(player_word)
    else
      @score = 0
      @message = 'not in the grid'
    end
  end

  def english_word?(player_word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{player_word}")
    json = JSON.parse(response.read)
    if json['found']
      compute_score(player_word)
    else
      @score = 0
      @message = 'not en english word'
    end
  end

  def compute_score(player_word)
    @score = player_word.length * 10
    @message = 'well done !'
  end
end
