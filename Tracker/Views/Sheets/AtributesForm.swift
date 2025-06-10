struct AtributesForm: View {
    var title = ""
    @Binding var selectedAttributes: [String]

    @State private var nameChecked = false
    @State private var priceBuyChecked = false
    @State private var priceSellChecked = false
    @State private var soldChecked = false
    @State private var stockChecked = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)").font(.headline)
            Divider()

            Group {
                toggleRow("Name", isChecked: $nameChecked)
                toggleRow("Price (sell)", isChecked: $priceSellChecked)
                toggleRow("Price (buy)", isChecked: $priceBuyChecked)
                toggleRow("Sold", isChecked: $soldChecked)
                toggleRow("Stock", isChecked: $stockChecked)
            }
        }
        .padding()
    }

    private func toggleRow(_ label: String, isChecked: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: isChecked.wrappedValue ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(.checkmark)
            Text(label)
        }
        .onTapGesture {
            isChecked.wrappedValue.toggle()
            if isChecked.wrappedValue {
                selectedAttributes.append(label)
            } else {
                selectedAttributes.removeAll { $0 == label }
            }
        }
    }
}
