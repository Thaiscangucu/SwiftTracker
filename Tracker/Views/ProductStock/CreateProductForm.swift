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

                Form {
                    /*Get user input*/
                    TextField("Name", text: $name)
                        .listRowSeparator(.visible)
                    HStack{
                        Text("Stock:       ")
                        TextField("", value: $stock, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        Text("Price Buy: ")
                        TextField("", value: $priceBuy, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                    }
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        Text("Price Sell:  ")
                        TextField("", value: $priceSell, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        Text("Sold:          ")
                        TextField("", value: $sold, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
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
