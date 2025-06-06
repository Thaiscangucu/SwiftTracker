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
    
    var filterProductDate: [Product] {
        viewModel.products.filter {
            dateFormater(date: $0.dateProduct!) == dateFormater(date: productdate)
        }
    }
    var body: some View {
        VStack{
            List(filterProductDate) { product in
                Section {
                    ProductView(product: product)
                }
            }
            .listStyle(.insetGrouped)
            .onAppear {
                viewModel.getProduct()
            }
        }
    }
}
