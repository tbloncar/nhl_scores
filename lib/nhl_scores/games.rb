module NHLScores
  class Games
    attr_reader :games

    require 'httparty'
    
    def initialize
      response = HTTParty.get(ENDPOINT).sub("loadScoreboard(", "").sub(")", "")
      @games   = JSON.parse(response)["games"].map { |game_attributes| Game.new(game_attributes) }
    end

    def all
      @games
    end

    def recent
      @games.select { |game| game if game.status == "final" }
    end

    def in_progress
      @games.select { |game| game if game.status == "progress" }
    end

    def upcoming
      @games.select { |game| game if game.status == "" }
    end
  end
end
