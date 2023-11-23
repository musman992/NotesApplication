import Foundation

// Define the Notes class
class Notes: Identifiable {
    let id = UUID()

    var name: String
    var text: String

    // Initializer to set the initial values
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
}


   
