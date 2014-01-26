require_relative 'nhl_scores/game'
require_relative 'nhl_scores/games'

module NHLScores
  ENDPOINT = "http://live.nhle.com/GameData/RegularSeasonScoreboardv3.jsonp"

  TEAM_ABBREV_MAP = {
    ana: "Anaheim Ducks",
    bos: "Boston Bruins",
    buf: "Buffalo Sabres",
    car: "Carolina Hurricanes",
    cbj: "Columbus Blue Jackets",
    cgy: "Calgary Flames",
    chi: "Chicago Blackhawks",
    col: "Colorado",
    dal: "Dallas Stars",
    det: "Detroit Red Wings",
    edm: "Edmonton Oilers",
    fla: "Florida Panthers",
    la:  "Los Angeles Kings",
    min: "Minnesota Wild",
    mtl: "Montréal Canadiens",
    nas: "Nashville Predators",
    nj:  "New Jersey Devils",
    nyi: "New York Islanders",
    nyr: "New York Rangers",
    ott: "Ottawa Senators",
    phi: "Philadelphia Flyers",
    phx: "Phoenix Coyotes",
    pit: "Pittsburgh Penguins",
    sj:  "San Jose Sharks",
    stl: "St. Louis Blues",
    tb:  "Tampa Bay Lightning",
    tor: "Toronto Maple Leafs",
    van: "Vancouver Canucks",
    wpg: "Winnipeg Jets",
    wsh: "Washington Capitals"
  }
end
