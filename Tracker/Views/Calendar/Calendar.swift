import SwiftUI

struct Calendar: View {
    @State private var date = Date()
    @State private var showingSheetCalendar: Bool = false
    
    @ObservedObject public var event: Event
    @ObservedObject var viewModel = ContentViewModel()
    
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
                
                List{
                    
                }.scrollContentBackground(.hidden)
                
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Calendar")
        }
       
        
    }
}

