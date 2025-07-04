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
                
                Text("Date is \(date.formatted(date: .long, time: .omitted))")
                    .font(.title3)
                
                
                NavigationLink(destination: CalendarProductData(productdate: date), label:{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 365, height: 45)
                        .foregroundStyle(Color.textField)
                        .overlay {
                            HStack{
                                Text("Sell Today")
                                    .foregroundStyle(Color.text)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.text)
                            }
                            .padding()
                            
                        }
                    
                })
                
                NavigationLink(destination: CalendarEventDate(eventdate: date), label:{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 365, height: 45)
                        .foregroundStyle(Color.textField)
                        .overlay {
                            HStack{
                                Text("Event Today")
                                    .foregroundStyle(Color.text)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.text)
                            }
                            .padding()
                        }
                    
                    
                })
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Calendar")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
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
            }
        }
        
        
        
    }
    
}

