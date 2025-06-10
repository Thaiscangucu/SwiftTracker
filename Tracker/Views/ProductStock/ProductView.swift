import SwiftUI

struct ProductView: View {
    @ObservedObject public var product: Product
    @ObservedObject var viewModel = ContentViewModel()
    
    @State private var showingEditSheet: Bool = false
    @State public var totalSell: Double = 0
    
    var body: some View {
        Grid (alignment: .leading) {
            HStack (){
                Text(product.name ?? "No name found.")
                    .font(.title3)
                    .bold()
                    .padding(.top, 0.5)
                Spacer()
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.accent)
                    .onTapGesture {
                        showingEditSheet.toggle()
                        
                    }
                
            }
            Divider()
            Text("Estoque: \(product.stock, specifier: "%.0f")")
                .font(.callout)
                .padding(.bottom, 0.5)
                .padding(.top)
            Text("Preço de Compra: R$\(product.priceBuy, specifier: "%.2f")")
                .font(.callout)
                .padding(.bottom, 0.5)
            Text("Preço de Venda: R$\(product.priceSell, specifier: "%.2f")")
                .font(.callout)
                .padding(.bottom)
            Divider()
            Stepper("Vendidas: \(product.sold, specifier: "%.0f")", onIncrement: {
                viewModel.sellProduct(product)
                totalSell += product.priceSell
            }, onDecrement: {
                viewModel.undoSell(product)
                totalSell -= product.priceSell
            })
            .padding(.top)
            .padding(.bottom, 0.5)
            .sheet(isPresented: $showingEditSheet, onDismiss: {
                viewModel.getProduct()
            }) {
                EditProductVIew(product: product)
            }
            
        }
        .onAppear(){
            viewModel.getProduct()
        }
    }
}

