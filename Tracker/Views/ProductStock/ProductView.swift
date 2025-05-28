import SwiftUI

struct ProductView: View {
    @State public var product: Product
    
    var body: some View {
        Grid (alignment: .leading) {
            Text(product.name ?? "No name found.")
                .font(.title3)
                .bold()
                .padding(.top, 0.5)
            Divider()
            Text("Stock: \(product.stock)")
                .font(.callout)
                .padding(.bottom, 0.5)
            Text("Price (bought): R$\(product.priceBuy, specifier: "%.2f")")
                .font(.callout)
                .padding(.bottom, 0.5)

                //.padding(.bottom, UIScreen.main.bounds.height * 0.02)
            Text("Price (sell): R$\(product.priceSell, specifier: "%.2f"))")
                .font(.callout)
        }
    }
}

