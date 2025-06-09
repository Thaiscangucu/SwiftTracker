//
//  CalendarEventDate.swift
//  Tracker
//
//  Created by anshu Li on 06/06/25.
//

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
        }
    }
}

#Preview {
    CalendarEventDate()
}
