import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    @State private var showingSheetCalendar: Bool = false
    
    
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
                
                                List(viewModel.events){
                                    ev in
                                            Section {
                                                EventView(event:ev)
                                            }
                
                
                
                            }.scrollContentBackground(.hidden)
                                .listStyle(.insetGrouped)
                
                //                Text("Total Sell: \()")
                //                Text("Total Price: \()")
                
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Calendar")
        }
        
        
    }
    
}
