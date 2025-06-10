//
//  SellView.swift
//  Tracker
//
//  Created by anshu Li on 09/06/25.
//

import SwiftUI

struct SellView: View {
    @ObservedObject public var sell: Sell
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        Grid (alignment: .leading) {
            Text(sell.productName ?? "No name found.")
                .font(.title3)
                .bold()
                .padding(.top, 0.5)
            Text("Price: R$\(sell.price, specifier: "%.2f")")
                .font(.callout)
                .padding(.bottom, 0.5)
            Text(sell.date?.formatted(date: .long, time: .shortened) ?? "No date")
                .font(.callout)
                .padding(.bottom)
        }
        .onAppear(){
            viewModel.getEvent()
        }
    }
}


