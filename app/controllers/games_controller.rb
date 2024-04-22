class GamesController < ApplicationController
  def new
    charset = Array('A'..'Z')
    @letters = Array.new(10) { charset.sample }.join
  end

  def included?
    params[:word].chars.all? { |letter| params[:word].count(letter) <= params[:letters].count(letter) }
  end

  def english_word?(word)
    response = URI.parse("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']

  end

  def score
    if included?
      if english_word?(params[:score])
        @score = true
        return score
      end
    end
  end
end
