class PokeDEXCLI::API
    BASE_URL = "https://pokeapi.co"

    def self.get_all_pokemon(page=nil)
        if page
            response = RestClient.get(page)
        else 
            response = RestClient.get("https://pokeapi.co/api/v2/pokemon?limit=151")
        end
        pokemon_array = JSON.parse(response.body)["results"]
#binding.pry
        pokemon_array.each do |pokemon|
            PokeDEXCLI::Pokemon.new(pokemon)
        end
    end
end
    
