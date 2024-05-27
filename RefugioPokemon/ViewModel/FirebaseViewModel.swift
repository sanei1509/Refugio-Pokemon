import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

class FirebaseViewModel: ObservableObject {
    @Published var show = false
    
    //LOGIN
    func login(email: String, pass: String, completion: @escaping(_ done: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if user != nil {
                print("Entro")
                completion(true)
            } else {
                if let error = error?.localizedDescription {
                    print("Error en firebase login", error)
                } else {
                    print("Error en la app")
                }
            }
        }
    }
    
    func createUser(email: String, pass: String, completion: @escaping(_ done: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if user != nil {
                print("Usuario Registrado")
                completion(true)
            } else {
                if let error = error?.localizedDescription {
                    print("Error en firebase registro", error)
                } else {
                    print("Error en la app")
                }
            }
        }
    }
    
    func logout() {
        try! Auth.auth().signOut()
        UserDefaults.standard.removeObject(forKey: "sesion")
        print("Cerrando sesion")
        self.show = false
    }
    
}


