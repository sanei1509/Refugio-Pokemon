import SwiftUI
import FirebaseAuth

struct Home: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        VStack {
            HStack (spacing: 25) {
                Text("Quiero adoptar").foregroundColor(.green)
                Text("Adoptados").foregroundColor(.blue)
                Text("Pokedex").foregroundColor(.gray)
            }
            Spacer()
            Text("Listado de publicaciones").font(.title)
//            ForEach(pokemonViewModel.pokemonCollection, id: \.self ) { item in
//                Text(item.name)
//                Text(item.url)
//            }
            Spacer()
        }
        .navigationTitle("Inicio")
    }
}
