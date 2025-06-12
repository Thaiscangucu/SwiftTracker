import SwiftUI

struct CardsSet: View {
    
    let dividerW: CGFloat = 1.5
    let dividerH: CGFloat = 35
    
    @StateObject var viewModel: ContentViewModel
    
    //MARK: - Unify all cards
    var body: some View {
            HStack{
                Spacer()
                DoubleCard(title: "Produtos", label: doubleFormatter(number: viewModel.totalProducts))
                Spacer()
                Divider().frame(width: dividerW, height: dividerH)
                Spacer()
                MoneyCard(title: "Vendas", label: doubleMoneyFormatter(number: viewModel.totalSell))
                Spacer()
                Divider().frame(width: dividerW, height: dividerH)
                Spacer()
                EventCard(title: "Lembretes", label: viewModel.eventsToday)
                Spacer()
            }
            .background(.princessBlue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal)
            .onAppear{
                
                
                viewModel.totalSell = 0
                viewModel.totalProducts = 0
                viewModel.eventsToday = 0
                
                viewModel.updateSellValue(sells: viewModel.sells)
                viewModel.updateProctCount(products: viewModel.products)
                viewModel.getTodayEventCount()
            }
    }
}


