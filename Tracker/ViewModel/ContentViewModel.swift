import Foundation
import CoreData

//MARK: -  Content View Model

class ContentViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var sells: [Sell] = []
    
    func getProduct() {
        products = CoreDataController.shared.fetchAllProducts()
    }
    
    func getSell() {
        sells = CoreDataController.shared.fetchAllSells()
    }
    
    func createProduct(id: UUID, name: String, priceBuy: Double, priceSell: Double,sold: Double, stock: Double) {
        let result = CoreDataController.shared.createProduct(id: id, name: name, priceBuy: priceBuy, priceSell: priceSell, sold: sold, stock: stock)
        
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
    }
    
    func undoSell(_ product: Product, _ sell: Sell){
        CoreDataController.shared.undoSell(product, sell)
    }
}
