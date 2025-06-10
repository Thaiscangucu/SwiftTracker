import SwiftUI

struct CalendarEventDate: View {
    var eventdate = Date()
    @ObservedObject var viewModel = ContentViewModel()
    
    var filterDate: [Event] {
        viewModel.events.filter {
            dateFormater(date: $0.dateEvent!) == dateFormater(date: eventdate)
        }
    }
    var body: some View {
        VStack{
            List(filterDate){
                ev in
                Section {
                    EventView(event: ev)
                }
                .listRowBackground(Color.textField)
                .swipeActions {
                    Button(role: .destructive) {
                        viewModel.deleteEvent(ev)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .onAppear(){
                viewModel.getEvent()
            }
        }
        .background(Color.background)
    }
}

#Preview {
    CalendarEventDate()
}
