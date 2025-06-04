import SwiftUI

struct CreateSheetForm: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ContentViewModel()
    
//    @State private var isOn = false
    
    /*Atributes of product*/
    @State var stock: Double = 0
    @State var sold: Double = 0
    @State var priceSell: Double = 0
    @State var priceBuy: Double = 0
    @State var name: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Linhas")
                    .bold()
                    .font(.largeTitle)
//                Toggle("Close windows when quitting an app", isOn: $isOn)
//                    .toggleStyle(.checkbox)
                

                Text("Colunas")
                    .font(.largeTitle)
                    .bold()
            }
            .navigationTitle("Criar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Salvar") {
//                        fetchAllProducts()
                        
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

#Preview {
    CreateSheetForm()
}



