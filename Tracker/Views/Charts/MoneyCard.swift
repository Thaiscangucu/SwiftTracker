import SwiftUI

struct MoneyCard: View {
    
    var title: String
    var label: Double
    
    init(title: String, label: Double) {
        self.title = title
        self.label = label
    }
    
    var body: some View {
        //TODO: - Verificador de casas para o label
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size: 15))
                .padding(.bottom, 2)
            Text("\(label,specifier: "%.0f")")
                .font(.system(size: 30))
                .fontWeight(.bold)
        }
        .padding(.vertical)
    
    }
}

#Preview {
    MoneyCard(title: "Vendas", label: 40)
}
