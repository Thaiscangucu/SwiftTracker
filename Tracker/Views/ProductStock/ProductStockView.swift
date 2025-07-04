import SwiftUI

struct ProductStockView: View {
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
                List(searchReults) { product in
                        Section {
                            ProductView(product: product)
                        }
                        .listRowBackground(Color.textField)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteProduct(product)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .background(Color.background)
            .navigationTitle("Produtos")
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
                        CreateProductForm()
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



