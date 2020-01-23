class PokeDEXCLI::API
    BASE_URL = "https://pokeapi.co"

    def get_all_pokemon(page=nil)
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon?limit=151")
        
        pokemon_array = JSON.parse(response.body)["results"]

        pokemon_array.each do |pokemon|
            
            pokemon_response = RestClient.get(pokemon["url"])
            pokemon_details = JSON.parse(pokemon_response.body)
            #binding.pry
            PokeDEXCLI::Pokemon.new(pokemon_details)
        end
    end

     

end
    
