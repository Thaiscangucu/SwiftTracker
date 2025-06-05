import SwiftUI

struct CardsSet: View {
    
    let dividerW: CGFloat = 1.5
    let dividerH: CGFloat = 35
    
    var body: some View {
            //TODO: - Fix Collors and parameters
            HStack{
                Spacer()
                Cards(title: "Vendas", label: 4)
                Spacer()
                Divider().frame(width: dividerW, height: dividerH)
                Spacer()
                Cards(title: "Produtos", label: 40)
                Spacer()
                Divider().frame(width: dividerW, height: dividerH)
                Spacer()
                Cards(title: "Lucro", label: 4)
                Spacer()
            }
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal)
        
    }
}

#Preview {
    CardsSet()
}
