import SwiftUI

struct Sheets: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State private var showingSheet: Bool = false
    @State var searchText: String = "" // Usado na busca
    
    var searchResults: [Product] {
        guard !searchText.isEmpty else {
            return viewModel.products
        }
        return viewModel.products.filter {
            $0.name?.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Color("Background").ignoresSafeArea()
                
                // Lista de planilhas dinâmicas
                List(viewModel.sheets) { sheet in
                    VStack(alignment: .leading) {
                        Text(sheet.name ?? "Sem nome")
                            .font(.headline)
                        
                        if let attrData = sheet.attributes,
                           let attrDecoded = try? JSONDecoder().decode([String].self, from: Data(base64Encoded: attrData) ?? Data()) {
                            Text(attrDecoded.joined(separator: ", "))
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        } else {
                            Text("Sem atributos selecionados")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Planilhas")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingSheet, onDismiss: {
                        viewModel.getSheets()
                        viewModel.getProduct()
                    }) {
                        CreateSheetView(product: Product())
                    }
                }
            }
            .onAppear {
                viewModel.getProduct()
                viewModel.getSheets()
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    Sheets()
}
