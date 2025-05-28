import SwiftUI

struct ProductStockView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var showingSheet = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.products) { product in
                    Section {
                        ProductView(product: product)
                    } 
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deleteProduct(product)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
                
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Product")
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
        }
    }
}

#Preview {
    ProductStockView()
}
