import SwiftUI

struct DoubleCard: View {
    
    var title: String
    var label: String
    
    init(title: String, label: String) {
        self.title = title
        self.label = label
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size: 15))
                .padding(.bottom, 2)
                .foregroundStyle(.white)
            Text(label)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .padding(.vertical)
    
    }
}


#Preview {
    DoubleCard(title: "Vendas", label: "30")
}

