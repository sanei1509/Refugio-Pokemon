import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                Home()
            }
            .tabItem {
                Label("Inicio", systemImage: "house")
            }
                        
            NavigationView {
                AddNew()
            }
            .tabItem {
                Label("Agregar", systemImage: "plus.circle")
            }
            
            NavigationView {
                SavedList()
            }
            .tabItem {
                Label("Guardados", systemImage: "bookmark")
            }
            
            NavigationView {
                Account()
            }
            .tabItem {
                Label("Cuenta", systemImage: "person")
            }

        }
    }
}
