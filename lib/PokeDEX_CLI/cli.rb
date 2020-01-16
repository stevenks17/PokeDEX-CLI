class PokeDEXCLI::CLI
    def start
        system('clear')

        puts "Welcome to your PokeDEX!"
        puts "Loading Data..."

        PokeDEXCLI::API.new.get_all_pokemon

        puts "Data loaded..."
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' in order to get a list of all 151 Kanto Region Pokemon."
        puts "Type 'exit' to exit program."
        main_menu_input
      end
    
      def sub_menu_options
        puts "Type the number associated with a Pokemon in order to get more information about it."
        puts "Type 'exit' to exit program."
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
    
        if user_input.to_i.between?(1, PokeDEXCLI::Pokemon.all.length)
          character = PokeDEXCLI::Pokemon.all[user_input.to_i - 1]
          print_pokemon_details(pokemon)
          continue?
        elsif user_input.downcase == "exit"
          goodbye
        else
          invalid_choice
          sub_menu_options
        end
      end
    
      def list_pokemon
        PokeDEXCLI::Pokemon.all.each.with_index(1) do |pokemon, i|
          puts "#{i}. #{pokemon.name}"
        end
      end
    
      def print_pokemon_details(pokemon)
        puts "Name: #{pokemon.name}"
        puts "Number: #{pokemon.id}"
        puts "Types: #{pokemon.types}"
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