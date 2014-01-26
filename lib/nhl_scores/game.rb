module NHLScores
  class Game
    attr_reader :id, :date, :start_time, :home_team, :away_team, :home_team_score,
      :away_team_score, :status, :ustv, :catv

    require 'httparty'
    
    def initialize(game_attributes)
      @id = game_attributes["id"]
      @date = game_attributes["ts"]
      @start_time = game_attributes["bs"]
      @home_team = alter_team_name("#{game_attributes["htn"]} #{game_attributes["htv"].capitalize}")
      @away_team = alter_team_name("#{game_attributes["atn"]} #{game_attributes["atv"].capitalize}")
      @home_team_score = game_attributes["hts"]
      @away_team_score = game_attributes["ats"]
      @status = game_attributes["tsc"]
      @ustv = game_attributes["ustv"]
      @catv = game_attributes["catv"]
    end

    def started?
      return false if status.empty? || home_team_score.empty? || away_team_score.empty?
      return true 
    end
    
    def winner
      not_final_message
      high_score_team
    end

    def loser
      not_final_message
      low_score_team
    end

    def winner_score
      not_final_message
      high_score
    end

    def loser_score
      not_final_message
      low_score
    end

    def leader
      not_in_progress_message
      high_score_team
    end

    def trailer
      not_in_progress_message
      low_score_team
    end

    def leader_score
      not_in_progress_message
      high_score
    end

    def trailer_score
      not_in_progress_message
      low_score
    end

    def includes_team?(team_name)
      return home_team == team_name || away_team == team_name
    end

    def team_name(team_abbrev)
      return TEAM_ABBREV_MAP[team_abbrev] if TEAM_ABBREV_MAP.has_key?(team_abbrev)
    end

    private

    def alter_team_name(team_name)
      case team_name
      when "NY Rangers Rangers"
        return "New York Rangers"
      when "NY Islanders Islanders"
        return "New York Islanders"
      when "Toronto Mapleleafs"
        return "Toronto Maple Leafs"
      when "Columbus Bluejackets"
        return "Columbus Blue Jackets"
      when "Detroit Redwings"
        return "Detroit Red Wings"
      else
        return team_name
      end
    end
    
    def high_score
      return home_team_score if home_team_score == away_team_score
      home_team_score > away_team_score ? home_team_score : away_team_score
    end

    def low_score
      return away_team_score if home_team_score == away_team_score
      home_team_score > away_team_score ? away_team_score : home_team_score
    end

    def high_score_team
      return home_team if home_team_score == away_team_score 
      home_team_score > away_team_score ? home_team : away_team
    end

    def low_score_team
      return away_team if home_team_score == away_team_score
      home_team_score > away_team_score ? away_team : home_team
    end

    def not_final_message
      "This game is not final." if status != "final"
    end

    def not_in_progress_message
      "This game is not in progress." if status != "progress"
    end
  end
end
