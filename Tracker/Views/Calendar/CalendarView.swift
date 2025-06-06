import SwiftUI

struct CalendarView: View {
    @State public var date = Date()
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
                
                NavigationLink(destination: CalendarProductData(productdate: date), label:{
                    Text("Product Today")
                })
                
                NavigationLink(destination: CalendarEventDate(eventdate: date), label:{
                    Text("Event Today")
                })
                
                
                
                
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Calendar")
        }
        
        
        
    }
    
}

