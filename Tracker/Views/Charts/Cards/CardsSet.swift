import SwiftUI

struct CardsSet: View {
    
    let dividerW: CGFloat = 1.5
    let dividerH: CGFloat = 35
    
    @ObservedObject var viewModel = ContentViewModel()

    
    
    var body: some View {
            //TODO: - Fix Collors and parameters
            HStack{
                Spacer()
                DoubleCard(title: "Vendas", label: viewModel.totalSell)
                Spacer()
                Divider().frame(width: dividerW, height: dividerH)
                Spacer()
                MoneyCard(title: "Produtos", label: 40)
                Spacer()
                Divider().frame(width: dividerW, height: dividerH)
                Spacer()
                DoubleCard(title: "Lucro", label: 4)
                Spacer()
            }
            .background(.princessBlue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal)
        
    }
}


//TODO: - Fucnion that formats label character
#Preview {
    CardsSet()
}
