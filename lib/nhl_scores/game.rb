module NHLScores
  class Game
    attr_reader :id, :date, :start_time, :home_team, :away_team, :home_team_score,
      :away_team_score, :status, :ustv, :catv

    require 'httparty'
    
    def initialize(game_attributes)
      @id = game_attributes["id"]
      @date = game_attributes["ts"]
      @start_time = game_attributes["bs"]
      @home_team = "#{game_attributes["htn"]} #{game_attributes["htv"].capitalize}"
      @away_team = "#{game_attributes["atn"]} #{game_attributes["atv"].capitalize}"
      @home_team_score = game_attributes["hts"]
      @away_team_score = game_attributes["ats"]
      @status = game_attributes["tsc"]
      @ustv = game_attributes["ustv"]
      @catv = game_attributes["catv"]
    end
  end
end
