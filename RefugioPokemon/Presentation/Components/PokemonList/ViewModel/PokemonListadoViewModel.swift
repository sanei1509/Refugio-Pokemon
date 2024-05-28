import Foundation

class PokemonListadoViewModel: ObservableObject {
    @Published var pokemonDatos: [Pokemon] = []
    private let repository = PokemonRepository()
    
    init(){
        fetchPokemon()
    }
    
    func fetchPokemon(){
        repository.fetchPokemon { pokemonDatos in
            self.pokemonDatos = pokemonDatos
        }
    }
}

