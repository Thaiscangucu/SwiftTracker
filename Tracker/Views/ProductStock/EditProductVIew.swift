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
                        Text("Nome: ")
                        TextField("", text: $name)
                            .foregroundStyle(.secondary)

                    }
                    .listRowBackground(Color.textField)

                    HStack{
                        Text("Estoque: ")
                        TextField("", value: $stock, format: .number)
                            .foregroundStyle(.secondary)
                    }
                    .listRowBackground(Color.textField)

                    HStack{
                        Text("Comprado por: R$")
                        TextField("", value: $priceBuy, format: .number)
                            .foregroundStyle(.secondary)

                    }
                    .listRowBackground(Color.textField)

                    HStack{
                        Text("Vendido por: R$")
                        TextField("", value: $priceSell, format: .number)
                            .foregroundStyle(.secondary)


                    }
                    .listRowBackground(Color.textField)

                }
                .scrollContentBackground(.hidden)

            }
            .background(Color.background)
            .navigationTitle("Editar")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Salvar") {
                        viewModel.editProduct(product: product, name: name, priceBuy: priceBuy, priceSell: priceSell, stock: stock)
                        dismiss()
                    }
                }
                /*Cancel Button*/
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}


