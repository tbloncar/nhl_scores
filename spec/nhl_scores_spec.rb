require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module NHLScores
  # TODO: This is in need of some mocking love.

  describe NHLScores do
    it 'should include a team abbreviation to name map' do
      expect(TEAM_ABBREVIATIONS[:pit]).to eq("Pittsburgh Penguins")
      expect(TEAM_ABBREVIATIONS[:mtl]).to eq("Montréal Canadiens")
    end
  end

  describe Games do
    subject(:games) { NHLScores::Games.new }

    it 'should be valid' do
      expect(games).to be_truthy
    end

    it 'should be initialized with games' do
      expect(games.games).to be_truthy
      expect(games.games.first.class).to eq(NHLScores::Game)
    end

    it 'should provide an array of all games' do
      expect(games.all.class).to eq(Array)
      expect(games.all.count).to eq(games.games.count)
    end

    def expect_games_with_status(collection, status)
      discovered_games = games.send(collection)
      expect(discovered_games.class).to eq(Array)
      return unless discovered_games.any?

      expect(discovered_games.first.status).to eq(status)
      expect(discovered_games.last.status).to eq(status)
    end

    it 'should provide an array of recent games' do
      expect_games_with_status(:recent, "final")
    end

    it 'should provide an array of games in progress' do
      expect_games_with_status(:in_progress, "progress")
    end

    it 'should provide an array of upcoming games' do
      expect_games_with_status(:upcoming, "")
    end

    context 'with team abbreviation provided' do
      def expect_team_included(collection, team_abbrev)
        discovered_games = games.send(collection, team_abbrev: team_abbrev)

        return unless discovered_games.any?
        expect(discovered_games.first.includes_team?(NHLScores::TEAM_ABBREVIATIONS[team_abbrev])).to be true
      end

      it 'should provide an array of all games including team' do
        %i[pit wsh vgk].each { |abbrev| expect_team_included(:all, abbrev) }
      end

      it 'should provide an array of recent games including team' do
        %i[tb phx sj].each { |abbrev| expect_team_included(:recent, abbrev) }
      end

      it 'should provide an array of games in progress including team' do
        %i[col wpg nj].each { |abbrev| expect_team_included(:in_progress, abbrev) }
      end

      it 'should provide an array of upcoming games including team' do
        %i[ana nyr chi].each { |abbrev| expect_team_included(:upcoming, abbrev) }
      end
    end
  end

  describe Game do
    context 'when final' do
      before(:all) do
        @game = NHLScores::Games.new.recent.first
      end

      it 'should provide the winning team' do
        winner = @game.home_team_score > @game.away_team_score ? @game.home_team : @game.away_team
        expect(@game.winner).to eq(winner)
      end

      it 'should provide the losing team' do
        loser = @game.home_team_score > @game.away_team_score ? @game.away_team : @game.home_team
        expect(@game.loser).to eq(loser)
      end

      it 'should provide the winning team\'s score' do
        winner_score = @game.home_team_score > @game.away_team_score ? @game.home_team_score : @game.away_team_score
        expect(@game.winner_score).to eq(winner_score)
      end

      it 'should provide the losing team\'s score' do
        loser_score = @game.home_team_score > @game.away_team_score ? @game.away_team_score : @game.home_team_score
        expect(@game.loser_score).to eq(loser_score)
      end

      it 'should indicate whether or not a certain team was/is involved' do
        expect(@game.includes_team?(@game.home_team)).to be true
        expect(@game.includes_team?(@game.away_team)).to be true
      end
    end
  end
end
