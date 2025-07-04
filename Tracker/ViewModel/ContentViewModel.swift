
import Foundation
import CoreData
import SwiftUI

//MARK: - Chart ViewModel

/*Aux Struct that interacts with core data and load info in memmory*/
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

//MARK: -  Content View Model
class ContentViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var sells: [Sell] = []
    @Published var events: [Event] = []

    /*Chart Vars*/
    @Published var linearChartData: [LineChartItem] = []
    @Published var linearSellsData: [LineChartItem] = []

    @Published var totalSell: Double = 0
    @Published var totalBuy: Double = 0
    @Published var totalProducts: Double = 0
    @Published var eventsToday: Double = 0

    //MARK: - Product and sell Log viewModel
    func getProduct() {
        products = CoreDataController.shared.fetchAllProducts()
        generateLinearProductChartData()
    }

    func updateProductValue(products: [Product]) {
        totalBuy = 0
        for product in products {
            totalBuy += (product.priceBuy * product.originalAmount)
        }
    }

    func updateProctCount(products: [Product]) {
        totalProducts = 0
        for product in products {
            totalProducts += product.stock
        }
    }

    func updateSellValue(sells: [Sell]) {
        totalSell = 0
        for sell in sells {
            totalSell += sell.price
        }
        saveWidgetSells()
    }

    func getSell() {
        sells = CoreDataController.shared.fetchAllSells()
        generateLinearSellsChartData()
    }

    func createProduct(id: UUID, name: String, priceBuy: Double, priceSell: Double, sold: Double, stock: Double, dateProduct: Date) {
        let result = CoreDataController.shared.createProduct(id: id, name: name, priceBuy: priceBuy, priceSell: priceSell, sold: sold, stock: stock, dateProduct: dateProduct)
        self.products.append(result)
    }

    func CreateSell(product: Product) {
        let result = CoreDataController.shared.CreateSell(product: product)
        self.sells.append(result)
    }

    func editProduct(product: Product, name: String, priceBuy: Double, priceSell: Double, stock: Double) {
        _ = CoreDataController.shared.editProduct(product: product, name: name, priceBuy: priceBuy, priceSell: priceSell, stock: stock)
    }

    func deleteProduct(_ product: Product) {
        CoreDataController.shared.deleteProduct(product)
    }

    func sellProduct(_ product: Product) {
        CoreDataController.shared.sellProduct(product)
        CreateSell(product: product)
    }

    func undoSell(_ product: Product) {
        CoreDataController.shared.undoSell(product)
    }

    //MARK: - Events viewModel
    func getEvent() {
        events = CoreDataController.shared.fetchAllEvents()
    }

    func createEvent(dateEvent: Date, nameEvent: String, context: String) {
        let result = CoreDataController.shared.createEvent(dateEvent: dateEvent, nameEvent: nameEvent, context: context)
        self.events.append(result)
    }

    func deleteEvent(_ event: Event) {
        CoreDataController.shared.deleteEvent(event)
    }

    func getTodayEventCount() {
        self.getEvent()
        
        let today = Date().onlyDate
        var count = 0
        for event in events{
            if event.dateEvent?.onlyDate == today {
                count += 1
            }
        }
        eventsToday = Double(count)
        saveWidgetEvents()
    }

    //MARK: - Creating Chart Structs
    private func generateLinearProductChartData() {
        linearChartData = products.compactMap({ product -> LineChartItem? in
            guard let date = product.dateProduct else { return nil }
            return LineChartItem(date: date.onlyDate, stock: product.stock)
        })
    }

    private func generateLinearSellsChartData() {
        linearSellsData = sells.compactMap({ sell -> LineChartItem? in
            guard let date = sell.date else { return nil }
            return LineChartItem(date: date.onlyDate, stock: sell.price)
        })
    }

    //MARK: - Widget Integration
    func saveWidgetSells() {
        let defaults = UserDefaults(suiteName: "group.com.joaomirandawidget.swifttracker")
        defaults?.set(totalSell, forKey: "dailySales")
    }
    
    func saveWidgetEvents() {
        let defaults = UserDefaults(suiteName: "group.com.joaomirandawidget.swifttracker")
        defaults?.set(eventsToday, forKey: "dailyEvents")
    }
}
