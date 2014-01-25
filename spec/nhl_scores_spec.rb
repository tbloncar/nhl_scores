require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module NHLScores
  describe Games do
    subject(:games) { NHLScores::Games.new }

    it 'should be valid' do
      games.should be_true
    end

    it 'should be initialized with games' do
      games.games.should be_true
      games.games.first.class.should == NHLScores::Game
    end

    it 'should provide an array of all games' do
      games.all.class.should == Array
      games.all.count.should == games.games.count
    end

    it 'should provide an array of recent games' do
      games.recent.class.should == Array
      if games.recent.any?
        games.recent.first.status.should == "final"
        games.recent.last.status.should == "final"
      end
    end

    it 'should provide an array of games in progress' do
      games.in_progress.class.should == Array
      if games.in_progress.any?
        games.in_progress.first.status.should == "progress"
        games.in_progress.last.status.should == "progress"
      end
    end

    it 'should provide an array of upcoming games' do
      games.upcoming.class.should == Array
      if games.upcoming.any?
        games.upcoming.first.status.should == ""
        games.upcoming.first.status.should == ""
      end
    end
  end

  describe Game do
    context 'when final' do
      subject(:game) { NHLScores::Games.new.recent.first }

      it 'should be valid' do
        game.should be_true
      end

      it 'should be initialized with the appropriate attributes' do
        game.should respond_to(:id)
        game.should respond_to(:date)
        game.should respond_to(:start_time)
        game.should respond_to(:home_team)
        game.should respond_to(:away_team)
        game.should respond_to(:home_team_score)
        game.should respond_to(:away_team_score)
        game.should respond_to(:status)
        game.should respond_to(:ustv)
        game.should respond_to(:catv)
      end

      it 'should provide the winning team' do
        winner = game.home_team_score > game.away_team_score ? game.home_team : game.away_team
        game.winner.should == winner
      end

      it 'should provide the losing team' do
        loser = game.home_team_score > game.away_team_score ? game.away_team : game.home_team
        game.loser.should == loser
      end
    end
  end
end
