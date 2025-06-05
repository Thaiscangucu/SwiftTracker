import SwiftUI

//TODO: Updtae save funcs for creating a new sheet


struct Sheets: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State private var showingSheet: Bool = false
    @State var searchText: String = "" // Used in Search bar
    
    var searchReults: [Product] {
        guard !searchText.isEmpty else {
            return viewModel.products
        }
        
        return viewModel.products.filter {
            $0.name!.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Color("Background").ignoresSafeArea()
                
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
                        viewModel.getProduct()
                    }) {
                        CreateSheetForm(product: Product())
                    }
                }
            }
            .onAppear {
                viewModel.getProduct()
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    Sheets()
}
