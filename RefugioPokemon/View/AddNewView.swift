import SwiftUI

struct AddNew: View {
    @State var titulo = ""
    @State var description = ""
    @State var namePokemon = ""
    
    let clasificaciones = ["adoptar", "adoptados", "pokedex"]
    @State var clasificacion = "pokedex"
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("Completa los datos necesarios")
                    .font(.headline)
                    .padding(.top, 20)
                Text("Puedes subir tu adopción exitosa, tu pokemon en adopción o un nuevo registro para la pokedex")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                //titulo del posteo
                TextField("Titulo de tu publicación", text: $titulo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .padding(.horizontal, 40)
                TextField("Nombre del pokemon", text: $namePokemon)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                
                Picker("Tipo de tu publicación", selection: $clasificacion) {
                    ForEach(clasificaciones, id: \.self) { item in
                        Text(item)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                
                TextEditor(text: $description)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
 

                Button(action: {
                    
                }){
                    Text("Guardar y Publicar")
                        .font(.title3)
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .background(.black)
                        .cornerRadius(5)
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Agregar")
        }
    }
}
