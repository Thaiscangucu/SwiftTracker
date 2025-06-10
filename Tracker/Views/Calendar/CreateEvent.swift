import SwiftUI

struct CreateEvent: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ContentViewModel()
    
    @State private var dateEvent = Date()
    @State var nameEvent: String = ""
    @State var context: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    TextField("Name", text: $nameEvent)
                        .listRowBackground(Color.textField)

                    TextField("Event", text: $context)
                        .listRowBackground(Color.textField)

                    DatePicker(selection: $dateEvent, in: Date.now...) {
                        Text("Select a time")
                    }
                    .listRowBackground(Color.textField)

                }
                .scrollContentBackground(.hidden)
            }
            .background(Color.background)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Save") {
                        viewModel.createEvent(dateEvent: dateEvent, nameEvent: nameEvent, context: context)
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
