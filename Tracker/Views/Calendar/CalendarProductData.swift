//
//  CalendarProductData.swift
//  Tracker
//
//  Created by anshu Li on 06/06/25.
//

import SwiftUI

struct CalendarProductData: View {
    var productdate = Date()
    @ObservedObject var viewModel = ContentViewModel()
    
    var filterProductDate: [Sell] {
        viewModel.sells.filter {
            dateFormater(date: $0.date!) == dateFormater(date: productdate)
        }
    }
    var body: some View {
        VStack{
            List(filterProductDate) { sells in
                Section {
                    SellView(sell: sells)
                }
                .listRowBackground(Color.textField)
                
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            .onAppear {
                viewModel.getSell()
            }
            
            
    
        }
        .background(Color.background)
    }
}
