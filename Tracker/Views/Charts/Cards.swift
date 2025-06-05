import SwiftUI

struct Cards: View {
    
    var title: String
    var label: Double
    
    init(title: String, label: Double) {
        self.title = title
        self.label = label
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size: 15))
            Text("\(label,specifier: "%.0f")")
                .font(.system(size: 30))
        }
        
    }
}

#Preview {
    Cards(title: "Vendas", label: 40)
}
