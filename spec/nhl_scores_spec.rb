require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module NHLScores
  describe NHLScores do
    it 'should include a team abbreviation to name map' do
      TEAM_ABBREV_MAP.should be_true
      TEAM_ABBREV_MAP[:pit].should == "Pittsburgh Penguins"
      TEAM_ABBREV_MAP[:mtl].should == "Montréal Canadiens"
    end
  end

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

    context 'with team abbreviation provided' do
      it 'should provide an array of all games including team' do
        games.all(team_abbrev: :pit).first.includes_team?("Pittsburgh Penguins").should be_true if games.all(team_abbrev: :pit).any?
        games.all(team_abbrev: :wsh).first.includes_team?("Washington Capitals").should be_true if games.all(team_abbrev: :wsh).any?
      end

      it 'should provide an array of recent games including team' do
        games.recent(team_abbrev: :tb).first.includes_team?("Tampa Bay Lightning").should be_true if games.recent(team_abbrev: :tb).any?
        games.recent(team_abbrev: :phx).first.includes_team?("Phoenix Coyotes").should be_true if games.recent(team_abbrev: :phx).any?
      end
      
      it 'should provide an array of games in progress including team' do
        games.in_progress(team_abbrev: :pit).first.includes_team?("Pittsburgh Penguins").should be_true if games.in_progress(team_abbrev: :pit).any?
        games.in_progress(team_abbrev: :col).first.includes_team?("Colorado Avalanche").should be_true if games.in_progress(team_abbrev: :col).any?
      end

      it 'should provide an array of upcoming games including team' do
        games.upcoming(team_abbrev: :ana).first.includes_team?("Anaheim Ducks").should be_true if games.upcoming(team_abbrev: :ana).any?
        games.upcoming(team_abbrev: :nyr).first.includes_team?("New York Rangers").should be_true if games.upcoming(team_abbrev: :nyr).any?
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

      it 'should indicate whether or not a certain team was/is involved' do
        game.includes_team?(game.home_team).should be_true
        game.includes_team?(game.away_team).should be_true
      end
    end
  end

  describe CLI do
  end
end
