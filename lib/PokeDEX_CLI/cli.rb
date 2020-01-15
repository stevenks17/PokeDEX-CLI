class PokeDEXCLI::CLI
    def start
        system('clear')

        puts "Welcome to your PokeDEX!"
        puts "Loading Data..."

        PokeDEXCLI ::API.new.get_all_pokemon

        puts "Data loaded..."
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' in order to get a list of all 151 Kanto Region Pokemon"
        puts "Type 'exit' to exit program"
        main_menu_input
      end
    
      def sub_menu_options
        puts "Type number associated with a Pokemon in order to get more information about the character"
        puts "Type 'exit' to exit program"
        sub_menu_input
      end
    
      def main_menu_input
        user_input = gets.strip
    
        if user_input == "1"
          list_pokemon
          sub_menu_options
        elsif user_input.downcase == "exit"
          goodbye
        else
          invalid_choice
          main_menu_options
        end
      end
    
      def sub_menu_input
        user_input = gets.strip
    
        if user_input.to_i.between?(1, PokeDEXCLI::Character.all.length)
          character = PokeDEXCLI::Character.all[user_input.to_i - 1]
          print_character_details(character)
          continue?
        elsif user_input.downcase == "exit"
          goodbye
        else
          invalid_choice
          sub_menu_options
        end
      end
    
      def list_characters
        PokeDEXCLI::Character.all.each.with_index(1) do |character, i|
          puts "#{i}. #{character.name}"
        end
      end
    
      def print_character_details(character)
        puts "Name: #{character.name}"
        puts "Number: #{character.number}"
        puts "Moves: #{character.moves}"
        puts "Types: #{character.types}"
      end
    
      def continue?
        puts "Type '1' for main menu, '2', to select another pokemon, 'exit' to exit program"
    
        user_input = gets.strip
    
        if user_input == "1"
          main_menu_options
        elsif user_input == "2"
          list_characters
          sub_menu_options
        elsif user_input == "exit"
          goodbye
        else
          invalid_choice
          continue?
        end
      end
    
      def goodbye
        puts "Closing PokeDEX"
        exit
      end
    
      def invalid_choice
        puts "Input not recognized please try your search again"
      end
    end