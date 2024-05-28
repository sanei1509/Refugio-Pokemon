import SwiftUI
import FirebaseAuth

struct Home: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Spacer()
                    Text("Pokedex")
                        .font(Font.system(size: 32,weight: .heavy))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding(.top, -50)
                        .padding(.bottom, 2)
                    Spacer()
                }
                
                Text("Listado de 100 pokemons para que puedas analizarlo!")
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                PokemonListado()
            
            }
            .padding(.horizontal, 10)
            .foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true) // Elimina la flecha hacia atrás predeterminada
            .background(.white)
            Spacer()
        }
        .foregroundColor(.white)
        .navigationBarTitleDisplayMode(.inline)
    }
}
