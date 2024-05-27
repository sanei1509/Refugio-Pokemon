import SwiftUI

struct ModelPokemon: Decodable {
    var count: Int
    var results: [Pokemon]
}

struct Pokemon: Decodable {
    var name: String
    var url: String
}
