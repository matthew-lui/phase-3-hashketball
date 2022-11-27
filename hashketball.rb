require 'pry'


def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }

end

def all_players
  # get all players then merge them into one array with the concat method or + method
  game_hash[:home][:players].concat( game_hash[:away][:players])
end


def num_points_scored (name)

  # a few methods will get this .find method is the same in Javascript and only find results that matches
  all_players.find { |player| player[:player_name]=== name}[:points]

end

def get_player(name)

  # created the get_player helper method that we can reuse to get other elements in array.  
  all_players.find do |player| player[:player_name] === name end
end

def num_points_scored(name)
  # get player name, then grabs points
  get_player(name)[:points]
end

def shoe_size(name)
  # get player then grabs shoe size
  get_player(name)[:shoe]
end

def team_colors(team_name)
  # checks the teams name if brooklyn nets, return home, then colors, otherwise return away and their colors
  team_name === "Brooklyn Nets" ? game_hash[:home][:colors] : game_hash[:away][:colors]
end

def team_names

   # goes into the game hash, looks into names, then team_names 
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def get_team_by_name(name)
  # helper method gets team by n ame , first grabs home team, if not home team, then returns away team
  game_hash[:home][:team_name] === name ? game_hash[:home] : game_hash[:away]
end

def player_numbers(team_name)

  #map method maps each team and returns the player, then returns their player number
  get_team_by_name(team_name)[:players].map do |player| player[:number] end
end

def player_stats(name)

  #reuse our get player method and pass in name argument to return all player stats. 
  get_player(name)
end

def big_shoe_rebounds
  # learn max_by and sortby method. It will be very useful. 
  all_players.max_by do |player| player[:shoe] end[:rebounds]
end

# binding.pry