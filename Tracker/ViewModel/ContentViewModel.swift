import Foundation
import CoreData

//MARK: -  Content View Model

class LineChartItem: Identifiable {
    var date: Date = Date()
    var stock: Double = 0.0
    
    init(date: Date, stock: Double) {
        self.date = date
        self.stock = stock
    }
    
    var description: String {
        return "\(date) - \(stock)"
    }
}

class ContentViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var sells: [Sell] = []
    @Published var events: [Event] = []
    
    @Published var totalSell: Double = 0
    @Published var totalBuy: Double = 0
    
    /*Chart Vars*/
    @Published var linearChartData: [LineChartItem] = []
    
    

    
    //MARK: - Product and sell Log viewModel
    func getProduct() {
        products = CoreDataController.shared.fetchAllProducts()
        generateChartData()
    }
    
    func getSell() {
        sells = CoreDataController.shared.fetchAllSells()
    }
    
    func createProduct(id: UUID, name: String, priceBuy: Double, priceSell: Double,sold: Double, stock: Double, dateProduct: Date) {
        let result = CoreDataController.shared.createProduct(id: id, name: name, priceBuy: priceBuy, priceSell: priceSell, sold: sold, stock: stock, dateProduct: dateProduct)
        
        totalBuy += priceBuy
        self.products.append(result)
    }
    
    
    
    func CreateSell (product: Product){
        let result = CoreDataController.shared.CreateSell(product: product)
        self.sells.append(result)

    }
    
    func editProduct(product: Product, name: String, priceBuy: Double, priceSell: Double, stock: Double) {
        let result = CoreDataController.shared.editProduct(product: product, name: name, priceBuy: priceBuy, priceSell: priceSell, stock: stock)
        
    }
    
    func deleteProduct(_ product: Product) {
        CoreDataController.shared.deleteProduct(product)
    }
    
    func sellProduct(_ product: Product){
        CoreDataController.shared.sellProduct(product)
        CreateSell(product: product)
        totalSell += product.priceSell
    }
    
    func undoSell(_ product: Product){
        CoreDataController.shared.undoSell(product)
    }
    
    //Mark: - Events viewModel
    
    func getEvent() {
        events = CoreDataController.shared.fetchAllEvents()
    }
    
    func createEvent(dateEvent: Date, nameEvent: String, context: String){
        let result = CoreDataController.shared.createEvent(dateEvent: dateEvent, nameEvent: nameEvent, context: context)
        
        self.events.append(result)

    }
    
    func deleteEvent(_ event: Event) {
        CoreDataController.shared.deleteEvent(event)
    }
    
    
    //MARK: Creating Chart Structs
    
    /*Linear Chart*/
    private func generateChartData() {
        linearChartData = products.compactMap({ product -> LineChartItem? in
            guard let date = product.dateProduct else { return nil }
            return LineChartItem(date: date.onlyDate, stock: product.stock)
        })
    }
    
    /**/
}

