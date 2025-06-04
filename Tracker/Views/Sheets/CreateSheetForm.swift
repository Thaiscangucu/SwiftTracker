import SwiftUI

// TODO: Checkbox for the atributes


struct CreateSheetForm: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ContentViewModel()
    
    @State private var choice: Int = 0
    
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
    CreateSheetForm()
}



