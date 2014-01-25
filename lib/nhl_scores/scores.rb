module NHLScores
  class Scores
    attr_reader :games

    require 'httparty'
    
    def initialize(game_attributes)
      response = HTTParty.get(ENDPOINT).sub("loadScoreboard(", "").sub(")", "")
      @games   = JSON.parse(response)["games"].map { |game| Game.new(game_attributes) }
    end

    def self.all
      @games
    end

    def self.recent
      @games.map { |game| game if game.status == "final" }.compact
    end

    def self.in_progress
      @games.map { |game| game if game.status == "progress" }.compact
    end

    def self.upcoming
      @games.map { |game| game if game.status == "" }.compact
    end
  end
end
