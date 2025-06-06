import SwiftUI

struct EditProductVIew: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ContentViewModel()
    @ObservedObject public var product: Product
    
    @State var stock: Double
    @State var sold: Double
    @State var priceSell: Double
    @State var priceBuy: Double
    @State var name: String
    
    init(product: Product) {
        self.product = product
        
        self.stock = product.stock
        self.sold = product.sold
        self.priceSell = product.priceSell
        self.priceBuy = product.priceBuy
        self.name = product.name ?? ""
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    /*Let the user acess only the atribute he wants*/
                    HStack{
                        Text("Name: ")
                        TextField("", text: $name)
                            .foregroundStyle(.secondary)

                    }
                    HStack{
                        Text("Stock: ")
                        TextField("", value: $stock, format: .number)
                            .foregroundStyle(.secondary)
                    }
                    HStack{
                        Text("Price Buy: R$")
                        TextField("", value: $priceBuy, format: .number)
                            .foregroundStyle(.secondary)

                    }
                    HStack{
                        Text("Price Sell: R$")
                        TextField("", value: $priceSell, format: .number)
                            .foregroundStyle(.secondary)


                    }
                }
            }
            .navigationTitle("Edit")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Save") {
                        viewModel.editProduct(product: product, name: name, priceBuy: priceBuy, priceSell: priceSell, stock: stock)
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
        }
    }
}


