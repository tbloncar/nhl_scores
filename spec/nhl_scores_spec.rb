require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module NHLScores
  describe Game do
    subject(:game) { NHLScores::Game.all[0] }
    
    it "should exist" do
      game.should be_true
    end

    it 'should have the correct class' do
      game.class.should == NHLScores::Game
    end

    it 'should have a class method that fetches all games' do
      NHLScores::Game.all.length.should be > 1
    end

    it 'should have a class method that fetches recent games' do
      NHLScores::Game.recent[0].status.should == "final"
      NHLScores::Game.recent[-1].status.should == "final"
    end

    it 'should have a class method that fetches upcoming games' do
      NHLScores::Game.upcoming[0].away_team_score.should == ""
      NHLScores::Game.upcoming[-1].home_team_score.should == ""
    end

    it 'should have a class method that fetches games in progress' do
      NHLScores::Game.in_progress[0].status.should == "progress"
      NHLScores::Game.in_progress[-1].status.should == "progress"
    end

    it 'should be initialized with the appropriate attributes' do
      game.should respond_to(:id)
      game.should respond_to(:date)
      game.should respond_to(:start_time)
      game.should respond_to(:away_team)
      game.should respond_to(:home_team)
      game.should respond_to(:home_team_score)
      game.should respond_to(:away_team_score)
      game.should respond_to(:status) 
      game.should respond_to(:ustv)
      game.should respond_to(:catv)
    end
  end
end
