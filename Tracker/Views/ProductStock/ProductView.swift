import SwiftUI

struct ProductView: View {
    @State public var product: Product
    
    var body: some View {
        VStack {
            Text("Stock: \(product.stock)")
                .font(.callout)
            Text("Price (bought): R$\(product.priceBuy, specifier: "%.2f")")
                .font(.callout)
            Text("Price (sell): R$\(product.priceSell, specifier: "%.2f"))")
                .font(.callout)
        }
    }
}
