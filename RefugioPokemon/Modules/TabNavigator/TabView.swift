import SwiftUI

struct MainTabView: View {
    @StateObject var favoritesManager = FavoritesManager()

    
    var body: some View {
        TabView {
            NavigationView {
                UserPostsView() // Cambiado a UserPostsView
            }
            .tabItem {
                Label("Inicio", systemImage: "house") // Cambia el icono si es necesario
            }
                        
            NavigationView {
                AddNew()
            }
            .tabItem {
                Label("Agregar", systemImage: "plus.circle")
            }
            
            NavigationView {
                Home()
            }
            .tabItem {
                Label("Pokedex", systemImage: "list.bullet")
            }.environmentObject(favoritesManager)
            
            
            NavigationView {
                FavoritesView()
            }.tabItem {
                Label("Favoritos", systemImage: "heart")
            }.environmentObject(favoritesManager)

            
            NavigationView {
                Account()
            }
            .tabItem {
                Label("Cuenta", systemImage: "person")
            }
            

        }
    }
}
