import Foundation
import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var pass = ""
    // llamar las funciones de cambiar usuario
    @StateObject var login = FirebaseViewModel()
    // Cambiar las vistas LOGIN -> HOME
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    var body: some View {
        ZStack {
            Color.brown.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text ("Refugio Pokemon")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text ("Comienza tu busqueda")
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                TextField("Correo electrónico", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .cornerRadius(5)
                SecureField("Contraseña", text: $pass)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .cornerRadius(5)
                Button(action: {
                    login.login(email: email, pass: pass) { (done) in
                        if done {
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
 
                    }
                }){
                    Text("Iniciar sesión")
                        .font(.title3)
                        .bold()
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .background(.black)
                        .cornerRadius(5)
                }
                
                Button(action: {
                    login.createUser(email: email, pass: pass) { (done) in
                        if done {
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
                    }
                }){
                    Text("Registrarme")
                        .font(.title3)
                        .bold()
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .background(.black)
                        .cornerRadius(5)
                }
                Spacer()
                
            }
        }
    }
}
