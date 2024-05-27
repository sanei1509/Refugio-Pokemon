import SwiftUI

struct Account: View {
    @EnvironmentObject var loginShow: FirebaseViewModel
    @StateObject var login = FirebaseViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
//                        try! Auth.auth().signOut()
                        UserDefaults.standard.removeObject(forKey: "sesion")
                        loginShow.show = false
            }){
                Text("Cerrar sesión")
            }
            
        }.navigationTitle("Ajustes")
    }
}
