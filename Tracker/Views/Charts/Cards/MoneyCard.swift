import SwiftUI

struct MoneyCard: View {
    
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

func textForCard (label: Double) -> String{
    var textComp = " " 
    
    if label > 1.000000000{
        textComp = "Bi"
    }else if label > 1000000{
        textComp = "Mi"
    }else{
        textComp = "Mil"
    }
    
    return textComp
}

#Preview {
    MoneyCard(title: "Vendas", label: "40")
}

