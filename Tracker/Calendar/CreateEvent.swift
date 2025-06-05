import SwiftUI

struct CreateEvent: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var dateEvent = Date()
    @State var nameEvent: String = ""
    @State var events: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    TextField("Name", text: $nameEvent)
                    TextField("Event", text: $events)
                    DatePicker(selection: $dateEvent, in: Date.now...) {
                        Text("Select a time")
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .background(Color.background)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Save") {
                        dismiss()
                    }
                }
                /*Cancel Button*/
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("New event")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}


#Preview {
    CreateEvent()
}
