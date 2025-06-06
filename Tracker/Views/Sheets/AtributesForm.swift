import SwiftUI

struct AtributesForm: View {
    var title = ""
    @State var nameChecked: Bool = false
    @State var priceBuyChecked: Bool = false
    @State var priceSellChecked: Bool = false
    @State var soldChecked: Bool = false
    @State var stockChecked: Bool = false
    
    @State var stock: String = ""
    @State var sold: String = ""
    @State var priceSell: String = ""
    @State var priceBuy: String = ""
    @State var name: String = ""
    
    @State var atributesChecked: [String] = []
    
    var body: some View{
        VStack(){
            Grid(alignment: .leading){
                Text("\(title)")
                    .font(.largeTitle)
                    .bold()
                Divider()
                HStack{
                    Image(systemName: nameChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.checkmark)
                    Text("Name")
                        .listRowSeparator(.visible)
                }
                .onTapGesture {
                    nameChecked.toggle()
                    atributesChecked.append(name)
                    
                }
                Divider()
                HStack{
                    Image(systemName: priceSellChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.checkmark)
                    Text("Price (sell)")
                        .listRowSeparator(.visible)
                }
                .onTapGesture {
                    priceSellChecked.toggle()
                    atributesChecked.append(priceSell)
                }
                Divider()
                HStack{
                    Image(systemName: priceBuyChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.checkmark)
                    Text("Price (buy)")
                        .listRowSeparator(.visible)
                }
                .onTapGesture {
                    priceBuyChecked.toggle()
                    atributesChecked.append(priceBuy)
                }
                Divider()
                HStack{
                    Image(systemName: soldChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.checkmark)
                    Text("Sold")
                        .listRowSeparator(.visible)
                }
                .onTapGesture {
                    soldChecked.toggle()
                    atributesChecked.append(sold)
                }
                Divider()
                HStack{
                    Image(systemName: stockChecked ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.checkmark)
                    Text("Stock")
                        .listRowSeparator(.hidden)
                }
                .onTapGesture {
                    stockChecked.toggle()
                    atributesChecked.append(stock)
                }
                Divider()

            }
        }
        .padding()
    }
}

#Preview {
    AtributesForm(title: "Linhas")
}
