
import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(favoritesManager.favorites, id: \.id) { pokemon in
                        NavigationLink(destination: PokemonDetalle(pokemon: pokemon)) {
                            PokemonCard(pokemon: pokemon)
                            .frame(maxWidth: 200, maxHeight: 300)
                        }
                    }
                }
                .padding(.vertical, 20)
            }
            //cambiar el color de "Mis favoritos"
            .foregroundColor(.black)
            .navigationTitle("Mis favoritos")
            .background(Color(.white)) // Fondo gris oscuro
            .onAppear{
                favoritesManager.loadFavorites()
            }
           
        }
        
    }
}

