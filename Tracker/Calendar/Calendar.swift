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
                    
                    Button {
                        showingSheetCalendar.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                
                Spacer()
            }
            .navigationTitle("Calendar")
        }
       
        
    }
}

#Preview {
    Calendar()
}
