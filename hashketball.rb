require 'pry'
def game_hash
  {
 :home =>{:team_name => 'Brooklyn Nets',
          :colors => ['Black','White'],
          :players => [
            {:player_name => 'Alan Anderson',
             :number => 0,
             :shoe => 16,
             :points => 22,
             :rebounds => 12,
             :assists => 12,
             :steals => 3,
             :blocks => 1,
             :slam_dunks => 1
             },
             
             {:player_name => 'Reggie Evans',
              :number => 30,
              :shoe => 14,
              :points => 12,
              :rebounds => 12,
              :assists => 12,
              :steals => 12,
              :blocks => 12,
              :slam_dunks => 7
              },
              
             {:player_name => 'Brook Lopez',
              :number => 11,
              :shoe => 17,
              :points => 17,
              :rebounds => 19,
              :assists => 10,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 15
              },
              
              {:player_name => 'Mason Plumlee',
               :number => 1,
               :shoe => 19,
               :points => 26,
               :rebounds => 11,
               :assists => 6,
               :steals => 3,
               :blocks => 8,
               :slam_dunks => 5
              },
              
              {:player_name => 'Jason Terry',
               :number => 31,
               :shoe => 15,
               :points => 19,
               :rebounds => 2,
               :assists => 2,
               :steals => 4,
               :blocks => 11,
               :slam_dunks => 1
              }
            ]
          },
              :away =>{:team_name => 'Charlotte Hornets',
                       :colors => ['Turquoise', 'Purple'],
                       :players => [
                          {:player_name => 'Jeff Adrien',
                           :number => 4,
                           :shoe => 18,
                           :points => 10,
                           :rebounds => 1,
                           :assists => 1,
                           :steals => 2,
                           :blocks => 7,
                           :slam_dunks => 2
                          },
                          
                          {:player_name => 'Bismack Biyombo',
                           :number => 0,
                           :shoe => 16,
                           :points => 12,
                           :rebounds => 4,
                           :assists => 7,
                           :steals => 22,
                           :blocks => 15,
                           :slam_dunks => 10
                          },
                          
                           {:player_name => 'DeSagna Diop',
                            :number => 2,
                            :shoe => 14,
                            :points => 24,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 4,
                            :blocks => 5,
                            :slam_dunks => 5
                           },
                           
                           {:player_name => 'Ben Gordon',
                            :number => 8,
                            :shoe => 15,
                            :points => 33,
                            :rebounds => 3,
                            :assists => 2,
                            :steals => 1,
                            :blocks => 1,
                            :slam_dunks => 0
                           },
                           
                           {:player_name => 'Kemba Walker',
                            :number => 33,
                            :shoe => 15,
                            :points => 6,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 7,
                            :blocks => 5,
                            :slam_dunks => 12
                           }
                   
                       ]
              } 
    
         }
              
end           
def num_points_scored(players_name)
  game_hash.each do |place,team|
   
    team.each do |att,data|
      
      if att == :players
        data.each do |player|
          
          if player[:player_name] == players_name
            #binding.pry
            return player[:points]
          end
        end
      end
    end
  end
end
def shoe_size(players_name)
  game_hash.each do |place,team|
    #binding.pry
    team.each do |att,data|
      if att == :players
        data.each do |player|
          if player[:player_name] == players_name
            #binding.pry
            return player[:shoe]
          end
        end
      end
    end
  end
end
def team_colors(team_name)
    game_hash.each do |place,team|
      if team[:team_name] == team_name
        #binding.pry
         return team[:colors]
      end
    end
end
def team_names
    game_hash.map do |place, team|
    team[:team_name]
    #binding.pry
    end
end
def player_numbers(team_name)
     number = []
    game_hash.each do |place,team|
    if team[:team_name] == team_name
      team.each do |att ,data|
        if att == :players
          data.each do |player|
         number << player[:number]
         #binding.pry
        end
        end
      end
    end
  end
  number
end
def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place,team|
    team.each do |att,data|
      if att == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
              #binding.pry
            end
          end
        end
      end
    end
  end
   new_hash
end

def big_shoe_rebounds
    biggest_shoe_size = 0
    rebounds_of_the_player = 0
    game_hash.each do |place,team|
      team[:players].each do |player|
        
        if player[:shoe] > biggest_shoe_size
          biggest_shoe_size = player[:shoe]
          rebounds_of_the_player = player[:rebounds]
          
         end

      end
      
    end
    return rebounds_of_the_player

end
def most_points_scored
  #player that score the most point 
   biggest_scored = 0
   player_name = ''
  game_hash.each do |place,team|
      team[:players].each do |player|
        
        if player[:points] > biggest_scored
          biggest_scored = player[:points]
          player_name = player[:player_name]
        end
      end
  end
    return player_name
end
def winning_team
     point_each_team = {"Brooklyn Nets" => 0 ,'Charlotte Hornets' => 0}
   
  game_hash.each do |place,team|
      team[:players].each do |player|
        point_each_team[team[:team_name]]+=player[:points]
        
        
     end
       
  end
     if point_each_team["Brooklyn Nets"] > point_each_team["Charlotte Hornets"]
       return "Brooklyn Nets"
     else
       return "Charlotte Hornets"
     end
end
def player_with_longest_name
     total_players = []
    game_hash.each do |place,team|
      team[:players].each do |player|
       total_players << player[:player_name]
        
       end
     end
      max = nil
     total_players.each do |word|
       if max == nil || word.length > max.length
         max = word
       
         
       end
       
  end
   return max

end

def long_name_steals_a_ton?
     most_steals = 0
     player_name = ''
     total_players = []
    game_hash.each do |place,team|
      team[:players].each do |player|
       total_players << player[:player_name]
        if player[:steals] > most_steals
          most_steals = player[:steals]
          player_name = player[:player_name]
        end
       end
     end
      max = ''
     total_players.each do |word|
       if  word.length > max.length
         max = word
         end
      end
     
     if max == player_name
       return true
     else
        return false 
     end
     
  end
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
  
                
              
          

 
 
      
    

         











