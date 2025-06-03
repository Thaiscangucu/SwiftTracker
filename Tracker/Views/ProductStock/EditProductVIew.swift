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
                    //TODO: - FORMATAR a Tela
                    TextField("Name: \(product.name ?? "")", text: $name)
                    TextField("Stock: \(product.stock, specifier: "%.0f")", value: $stock, format: .number)
                    TextField("Price Buy: R$ \(product.priceBuy, specifier: "%.2f")", value: $priceBuy, format: .number)
                    TextField("Price Sell: R$ \(product.priceSell, specifier: "%.2f")", value: $priceSell, format: .number)
                    TextField("Sold: \(product.sold, specifier: "%.0f")", value: $sold, format: .number)
                }
                Button {
                    viewModel.editProduct(product: product, name: name, priceBuy: priceBuy, priceSell: priceSell, sold: sold, stock: stock)
                    dismiss()
                }label: {
                    Text("SAVE")
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Save") {
                        viewModel.editProduct(product: product, name: name, priceBuy: priceBuy, priceSell: priceSell, sold: sold, stock: stock)
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


