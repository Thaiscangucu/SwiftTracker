import SwiftUI

struct CreateSheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject public var product: Product
    var body: some View {
        
        NavigationStack{
            
            
                AtributesForm(title: "Linhas")
                AtributesForm(title: "Colunas")
            
            .navigationTitle("Nova Planilha")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button("Salvar") {
//                        fetchAllSheets()
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
        .padding(.bottom)
    }
}

#Preview {
    CreateSheetView(product: Product())
}



