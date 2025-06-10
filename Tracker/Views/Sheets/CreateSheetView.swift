//import SwiftUI
//
//struct CreateSheetView: View {
//    @Environment(\.dismiss) var dismiss
//    @ObservedObject public var product: Product
//
//    @State private var sheetName: String = ""
//    @State private var selectedAttributes: [String] = []
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Form {
//                    Section(header: Text("Nome da Planilha")) {
//                        TextField("Ex: Controle de Estoque", text: $sheetName)
//                            .textFieldStyle(.roundedBorder)
//                    }
//
//                    Section(header: Text("Linhas")) {
//                        AtributesForm(title: "Linhas", selectedAttributes: $selectedAttributes)
//                    }
//
//                    Section(header: Text("Colunas")) {
//                        AtributesForm(title: "Colunas", selectedAttributes: $selectedAttributes)
//                    }
//                }
//            }
//            .navigationTitle("Nova Planilha")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .confirmationAction) {
//                    Button("Salvar") {
//                        CoreDataController.shared.createSheet(name: sheetName, attributes: selectedAttributes)
//                        dismiss()
//                    }
//                }
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("Cancelar") {
//                        dismiss()
//                    }
//                }
//            }
//        }
//        .padding(.bottom)
//    }
//}
//
//#Preview {
//    CreateSheetView(product: Product())
//}
