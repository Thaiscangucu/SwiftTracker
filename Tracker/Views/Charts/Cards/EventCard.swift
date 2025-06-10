import SwiftUI

struct EventCard: View {
    
    var title: String
    var label: Double
    
    init(title: String, label: Double) {
        self.title = title
        self.label = label
    }
    
    
    
    var body: some View {
        VStack(alignment: .center){
            Text(title)
                .font(.system(size: 15))
                .padding(.bottom, 2)
                .foregroundStyle(.white)
            Text("\(label, specifier: "%.0f")")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .padding(.vertical)
    
    }
}


#Preview {
    EventCard(title: "Vendas", label: 30)
}

