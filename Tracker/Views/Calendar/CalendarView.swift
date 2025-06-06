import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    @State private var showingSheetCalendar: Bool = false
    
    @ObservedObject var viewModel = ContentViewModel()
    
    
    var filterDate: [Event] {
        viewModel.events.filter {
            $0.dateEvent == date
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                DatePicker("Select Date", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
  
                HStack{
                    Text("Date is \(date.formatted(date: .long, time: .omitted))")
                        .font(.title3)
                    
                    Button {
                        showingSheetCalendar.toggle()
                    } label: {
                        Spacer()
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingSheetCalendar) {
                        CreateEvent()
                    }
                    
                }
                .padding()
                //List goes here
                
                List(viewModel.events.filter {
                    $0.dateEvent == date
                }){
                    ev in
                    Section {
                        EventView(event: ev)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deleteEvent(ev)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
                .onAppear(){
                    viewModel.getEvent()
                }
                
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Calendar")
        }
        
        
        
    }
    
}

