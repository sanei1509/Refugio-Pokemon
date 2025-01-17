import SwiftUI

struct PokemonCard: View {
    @ObservedObject var viewModel: PokemonCardViewModel
    
    // Estructura para almacenar los detalles del Pokémon
    init(pokemon: Pokemon) {
        self.viewModel = PokemonCardViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        ZStack{
            
            ZStack{
                VStack{
                    if viewModel.isLoading {
                        skeletonCardView
                    }
                    else{
                        headerView
                        imageTagsView
                    }
                }
                
            }

            .padding(.top, 8).padding(.bottom, 10).padding(.horizontal, 8)
            .background(Color(backgroundColor(forType: viewModel.pokemonDetails?.types[0].type.name ?? "default")))

            .cornerRadius(20)

            //POKEBOLE IN THE BACKGROUND
            ZStack{
                Image("vector")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 80, maxHeight: 80)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.15) // Puedes ajustar la opacidad según tus necesidades
            }
            .zIndex(0)

        }
        .onAppear{
            viewModel.loadPokemonDetails()
        }
        .shadow(color: Color(backgroundColor(forType: viewModel.pokemonDetails?.types[0].type.name ?? "default")).opacity(0.9), radius: 10, x: 0, y: 0)
    // END BODY the next
    }
    // COMPONENTS OF DESIGN
    private var headerView: some View {
        HStack{
            Text(viewModel.pokemon.name.capitalized)
                .bold()
                .foregroundColor(.white)
                .font(Font.system(size: 21, weight: .heavy))
            
            Spacer()
            
            // Show the #ID of the pokemon
            if let id = viewModel.pokemonDetails?.id {
                Text("#\(id)")
                    .foregroundColor(.white)
                    .font(Font.system(size: 21, weight: .heavy))
                    .opacity(0.4)
            }
        }
    }
    
    private var imageTagsView: some View {
        HStack{
            // Mostrar todas las etiquetas de tipo del Pokémon
            VStack (spacing: 10) {
                ForEach(viewModel.pokemonDetails?.types ?? [], id: \.type.name) { typeElement in
                    Text(typeElement.type.name.capitalized)
                        .font(Font.system(size: 12, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.white.opacity(0.30)))
                        .cornerRadius(25)
                        .frame(height: 25)
                }
            }
            
            // sprites / oficial-artwork / front_default
            if let image = viewModel.pokemonImage {
                image
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            
            
        }
    }
    
    private var skeletonCardView: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.1))
            .frame(width: 165, height: 100)
            .cornerRadius(10)
            .overlay(ProgressView())
    }
}

#Preview {
    PokemonCard(pokemon: Pokemon.samplePokemon) // le paso el sample pokemon con el objeto / instancia de prueba
}

