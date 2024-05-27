import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginShow: FirebaseViewModel
    @StateObject var pokemon = PokemonViewModel()
    
    var body: some View {
        return Group {
            if loginShow.show {
                //HOME SCREEN
                MainTabView()
            } else {
                Login()
                    .edgesIgnoringSafeArea(.all)
                    .preferredColorScheme(.light)
            }
        }.onAppear {
            if (UserDefaults.standard.object(forKey: "sesion")) != nil {
                loginShow.show = true
            }
        }
    }
}

#Preview {
    ContentView()
}
