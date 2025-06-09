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
                    List{
                        Section{
                            HStack{
                                Text("Sell Today")
                                Spacer()
                                Image(systemName: "arrow.right")
                            }                        }
                    }
                })
                
                NavigationLink(destination: CalendarEventDate(eventdate: date), label:{
                    List{
                        Section{
                            HStack{
                                Text("Event Today")
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            
                        }
                    }
                       
                })
                
                
                
                
                
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Calendar")
        }
        
        
        
    }
    
}

