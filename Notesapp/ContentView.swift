import SwiftUI
 class NotesViewModel: ObservableObject {
    @Published var notes: [Notes] = [
        Notes(name: "All iCloud", text: "folder"),
        Notes(name: "Notes", text: "folder"),
        Notes(name: "New Folder", text: "folder"),
        Notes(name: "Recently Deleted", text: "trash")
        
    ]
}

                    
struct ContentView: View {
    @StateObject private var noteViewModel = NotesViewModel()
    @State private var searchText = ""
    //    @State private var file = newfile ()
    
    var body: some View {
        VStack {
            
            
            NavigationView {
                List {
                    ForEach(noteViewModel.notes) { note in
                        NavigationLink(destination: TextEditor(text: .constant("Enter text"))) {
                            HStack {
                                Image(systemName: note.text)
                                    .foregroundColor(.yellow)
                                Text(note.name)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                }
                
                .searchable(text: $searchText)
                .navigationTitle("Folders")
//
                    .toolbar { //edit on top
                        EditButton()
                            .foregroundColor(.yellow)
                    
                        
                       
                                    
                                                    Button(action: {
                                                        // Add the action to be performed when VoiceOver user interacts with the symbol
                                                        print("VoiceOver symbol tapped")
                                                        // Add your specific action here, e.g., speak the translated text
                                                    }) {
                                                        Image(systemName: "voiceover") // Use the appropriate VoiceOver symbol
                                                            .font(.system(size: 30))
                                                            .foregroundColor(.yellow
                                                        )
                                                           
                                                    }
                        
                    }
                    .toolbar { //icons on the bottom
                        
                        ToolbarItem(placement: .bottomBar) {
                            ForEach(noteViewModel.notes) { note in
                                NavigationLink(destination: TextEditor(text: .constant("Placeholder"))){
                                    
                                    
                                    Button {
                                        print("Edit button was tapped")
                                    } label: {
                                        NavigationLink(destination: FolderView()){
                                            Image(systemName: "folder.badge.plus")}
                                    }
                                    
                                    .foregroundColor(.yellow)
                                }
                            }
                        }
                        
                        ToolbarItem(placement: .bottomBar){
                            Button {
                                print("Edit button was tapped")
                            } label: {
                                NavigationLink(destination: FolderView()){
                                    
                                    
                                    Image(systemName: "square.and.pencil")}
                            }.foregroundColor(.yellow)
                            
                        }
                        
                        
                        
                    }
                }
                //
                //
                //            }
            }
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

