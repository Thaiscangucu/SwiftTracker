import SwiftUI

//MARK: - Create Product View
//TODO: - Fix number input
struct CreateProductForm: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ContentViewModel()
    
    /*Atributes of product*/
    @State var stock: Double = 0
    @State var sold: Double = 0
    @State var priceSell: Double = 0
    @State var priceBuy: Double = 0
    @State var name: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Form {
                    /*Get user input*/
                    TextField("Name", text: $name)
                    TextField("Stock", value: $stock, format: .number)
                    TextField("Price Buy", value: $priceBuy, format: .number)
                    TextField("Price Sell", value: $priceSell, format: .number)
                    TextField("Sold", value: $sold, format: .number)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Save") {
                        viewModel.createProduct(id: UUID(), name: name, priceBuy: priceBuy, priceSell: priceSell,
                            sold: sold, stock: stock)
                        
                        dismiss()
                    }
                }
                /*Cancel Button*/
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
    CreateProductForm()
}
