import SwiftUI

struct CreateProductView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var stock: Int64 = 0
    @State var priceSell: Double = 0
    @State var priceBuy: Double = 0
    @State var name: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Form {
                    TextField("Name", text: $name)
                    TextField("Stock", value: $stock, format: .number)
                    TextField("Price Buy", value: $priceBuy, format: .number)
                    TextField("Price Sell", value: $priceBuy, format: .number)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        viewModel.createProduct(id: UUID(), name: name, priceBuy: priceBuy, priceSell: priceSell, stock: stock)
                        
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    CreateProductView()
}
