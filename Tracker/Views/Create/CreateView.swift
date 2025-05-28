import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var showingSheet = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.products) { product in
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading) {
                            Text(product.name ?? "No name found.")
                                .bold()
                            //TODO: - Mostrar Numeros
                            Text(product.name ?? "No products in stock.")
                                .font(.caption)
                        }
                        .padding(.leading, 5)
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
    CreateView()
}
