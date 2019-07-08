require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = shuffle_letters
  end

  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word_dictionary = open(url).read
    word = JSON.parse(word_dictionary)
    return { found: word['found'], length: word["length"] }
  end

  def letters_answer
    params[:word].chars.sort.all? { |letter| params[:letter].include?(letter) }
  end

  def score
    if english_word[:found]
      @result = "Congrats found score #{english_word[:length]}"
    elsif !english_word
      @result = "It's not an english world"
    else
      @result = "Your world don't use#{params[:letters]}"
    end
  end

  private

  def shuffle_letters
    (0...10).map { ('a'..'z').to_a[rand(26)] }
  end
end
