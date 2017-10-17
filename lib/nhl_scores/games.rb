module NHLScores
  class Games
    attr_reader :games

    require 'httparty'

    def initialize
      response = HTTParty.get(ENDPOINT).sub("loadScoreboard(", "").sub(")", "")
      @games   = JSON.parse(response)["games"].map { |game_attributes| Game.new(game_attributes) }
    end

    def all(team_abbrev: nil)
      return @games if team_abbrev.nil?
      team_name = team_name(team_abbrev)
      return @games.select { |game| game if game.includes_team?(team_name) }
    end

    def recent(team_abbrev: nil)
      all(team_abbrev: team_abbrev).select { |game| game if game.status == "final" }
    end

    def in_progress(team_abbrev: nil)
      all(team_abbrev: team_abbrev).select { |game| game if game.status == "progress" }
    end

    def upcoming(team_abbrev: nil)
      all(team_abbrev: team_abbrev).select { |game| game if game.status == "" }
    end

    private

    def team_name(team_abbrev)
      return TEAM_ABBREVIATIONS.fetch(team_abbrev.to_sym)
    end
  end
end
