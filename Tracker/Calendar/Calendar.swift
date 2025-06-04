//
//  Calendar.swift
//  Tracker
//
//  Created by anshu Li on 03/06/25.
//

import SwiftUI

struct Calendar: View {
    @State private var date = Date()
    @State private var showingSheetCalendar: Bool = false
    
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

#Preview {
    Calendar()
}
