import SwiftUI

// TODO: Arrumar atributos lista 


struct CreateSheetForm: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject public var product: Product
    @ObservedObject var viewModel = ContentViewModel()
    
    /*Atributes of product*/
    @State var stock: Double = 0
    @State var sold: Double = 0
    @State var priceSell: Double = 0
    @State var priceBuy: Double = 0
    @State var name: String = ""
//    var atributes: [String] = ["name", "stock", ]
    var body: some View {
        NavigationStack{

            VStack{
                Text("Linhas")
                    .bold()
                    .font(.largeTitle)
                
                Form{
                    Text("Name")
                        .listRowSeparator(.visible)
                }
                Text("Colunas")
                    .font(.largeTitle)
                    .bold()
            }
        
            .navigationTitle("Criar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button("Salvar") {
//                        fetchAllProducts()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateSheetForm(product: Product())
}



