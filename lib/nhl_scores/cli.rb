require 'thor'

module NHLScores
  class CLI < Thor
    attr_reader :games

    def initialize(*args)
      super
      @games = NHLScores::Games.new
    end

    desc 'recent', 'get scores of RECENT games'
    method_option 'team', aliases: '-t', type: :string, default: nil, desc: 'Specify a single team by abbreviation.'
    def recent
      games = @games.recent(team_abbrev: options['team'])
      output_games(games, 'recent')
    end

    desc 'current', 'get scores of CURRENT games'
    method_option 'team', aliases: '-t', type: :string, default: nil, desc: 'Specify a single team by abbreviation.'
    def current
      games = @games.in_progress(team_abbrev: options['team'])
      output_games(games, 'current')
    end

    desc 'upcoming', 'get UPCOMING games on schedule'
    method_option 'team', aliases: '-t', type: :string, default: nil, desc: 'Specify a single team by abbreviation.'
    def upcoming
      games = @games.upcoming(team_abbrev: options['team'])
      output_games(games, 'upcoming')
    end

    private

    def output_games(games, type)
      puts
      title     = "#{type.upcase} NHL GAMES"
      underline = "-" * title.length 
      puts TextHelpers.yellow(TextHelpers.align(title))
      puts TextHelpers.align(underline)
      puts
      if games.any?
        games.each do |game|
          send("output_#{type}_game", game)
        end
      else
        puts TextHelpers.align("There are no #{type} games.")
      end
      puts
    end

    def output_recent_game(game)
      puts TextHelpers.align("#{game.date}:") + " #{game.winner} defeat #{game.loser} (#{game.winner_score}-#{game.loser_score})"
    end

    def output_current_game(game)
      if game.started?
        score_descriptor = score_descriptor_string(game)
        output = TextHelpers.align("IN PROGRESS:") + " #{game.leader} #{score_descriptor} #{game.trailer} (#{game.leader_score}-#{game.trailer_score})"
      else
        output = TextHelpers.align("PRE GAME:") + " #{game.home_team} vs. #{game.away_team}"
      end
      output += tv_string(game)
      puts output
    end

    def output_upcoming_game(game)
      output = TextHelpers.align("#{game.date} @ #{game.start_time} (EST):") + " #{game.home_team} vs. #{game.away_team}"
      output += tv_string(game)
      puts output
    end

    def tv_string(game)
      return " on #{game.ustv} (US)" if !game.ustv.empty? && game.catv.empty?
      return " on #{game.catv} (CA)" if !game.catv.empty? && game.ustv.empty?
      return " on #{game.ustv} (US) & #{game.catv} (CA)" if !game.ustv.empty? && !game.catv.empty?
      return ""
    end

    def score_descriptor_string(game)
      return "tied with" if game.home_team_score == game.away_team_score
      return "lead"
    end
  end

  class TextHelpers
    class << self
      def yellow(str)
        color(str, "\e[0;33m")
      end

      def align(str)
        str.rjust(32)
      end

      private

      def color(text, color_code)
        "#{color_code}#{text}\e[0m"
      end
    end
  end
end
