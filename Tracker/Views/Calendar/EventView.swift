//
//  EventView.swift
//  Tracker
//
//  Created by anshu Li on 05/06/25.
//

import SwiftUI

struct EventView: View {
    @ObservedObject public var event: Event
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        Grid (alignment: .leading) {
            Text(event.nameEvent ?? "No name found.")
                .font(.title3)
                .bold()
                .padding(.top, 0.5)
            Text(event.context ?? "No context")
                .font(.callout)
                .padding(.bottom, 0.5)
            Text(event.dateEvent?.formatted(date: .long, time: .shortened) ?? "No date")
                .font(.callout)
                .padding(.bottom)
        }
        .onAppear(){
            viewModel.getEvent()
        }
    }
}
