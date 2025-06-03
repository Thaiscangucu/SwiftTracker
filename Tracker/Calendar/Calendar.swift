//
//  Calendar.swift
//  Tracker
//
//  Created by anshu Li on 03/06/25.
//

import SwiftUI

struct Calendar: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Select Date", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.graphical)
        
        
    }
}

#Preview {
    Calendar()
}
