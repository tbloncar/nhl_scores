NHL Scores
----------

[![Build Status](https://travis-ci.org/tbloncar/nhl_scores.png?branch=master)](https://travis-ci.org/tbloncar/nhl_scores)

Use Ruby to fetch details about recent, current, and upcoming regular season NHL matchups.

#### Installation

Tested with `ruby-2.0.0-p247`.

    gem install nhl_scores

#### Usage Details

An instance of the `NHLScores::Games` class gives you access to NHL game
data fetched from [this
endpoint](http://live.nhle.com/GameData/RegularSeasonScoreboardv3.jsonp).
Instances of this class are initialized with an array of
`NHLScores::Game` instances in the `games` attribute. The
following methods are at your disposal for interacting with
the `NHLScores::Games` instance.

- `NHLScores::Games#all` - Returns an array of all games available via the endpoint
- `NHLScores::Games#recent` - Returns an array of games recently completed
- `NHLScores::Games#in_progress` - Returns an array of current games (including
  those in pre-game)
- `NHLScores::Games#upcoming` - Returns an array of upcoming games

Each array consists of zero or more instances of the aforementioned
`NHLScores::Game` class. Each game instance has the following properties:

- `id`
- `date`
- `start_time`
- `home_team`
- `away_team`
- `home_team_score`
- `away_team_score`
- `status`
- `ustv` (US television)
- `catv` (Canadian television)

The public API also exposes the following methods:

- `NHLScores::Game#winner` - Returns the winning team for a completed game
- `NHLScores::Game#loser` - Returns the losing team for a completed game
- `NHLScores::Game#winner_score` - Returns the winning score for a completed game
- `NHLScores::Game#losing_score` - Returns the losing score for a completed game
- `NHLScores::Game#leader` - Returns the leading team for a game in progress
- `NHLScores::Game#trailer` - Returns the trailing team for a game in progress
- `NHLScores::Game#leader_score` - Returns the leading score for a game in progress
- `NHLScores::Game#trailer_score` - Returns the trailing score for a game in progress

#### CLI

This gem comes with a CLI that can be used to fetch details about recent,
current, and upcoming games via the command line.

**Recent Scores**

    nhl recent

**Current Scores**

    nhl current

**Upcoming Games**

    nhl upcoming

**Narrow the Response**

You can use the `--team (-t)` option with a team abbreviation to
narrow your results. The full list of team abbreviation-name mappings
can be found in `lib/nhl_scores.rb`.

    nhl upcoming -t pit

Let's go Pens.

#### License

Copyright (c) 2014 Travis Loncar.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
