import SwiftUI

struct AtributesForm: View{
    var title : String = ""
    var body: some View {
        VStack(){
        
            Form{
                Text("\(title)")
                    .font(.largeTitle)
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Name")
                        .listRowSeparator(.visible)
                }
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Price (sell)")
                        .listRowSeparator(.visible)
                }
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Price (buy)")
                        .listRowSeparator(.visible)
                }
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Price (sell)")
                        .listRowSeparator(.visible)
                }
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Sold")
                        .listRowSeparator(.visible)
                }
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("Stock")
                        .listRowSeparator(.visible)
                }
            }
        }
    }
}

#Preview {
    AtributesForm()
}
