import SwiftUI
import FirebaseAuth

//Manejar todos los datos de los pokemons
class PokemonViewModel: ObservableObject {
    @Published var pokemonCollection: [PokemonModel] = []
    @Published var countPokedex: Int = 0
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=5") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            //Decodifico el json
            guard let data = data else { return }
            
            do {
                let datos = try JSONDecoder().decode(ModelPokemon.self, from: data)
                print("Datos===== \n", datos)
                DispatchQueue.main.async {
                    print("Datos.Results====== \n",datos.results)
                    self.pokemonCollection = datos.results
                    self.countPokedex = datos.count
                }
                
                
            } catch let error {
                print("Error al traer datos getData()" ,error)
            }
        }.resume()
    }
    
}
