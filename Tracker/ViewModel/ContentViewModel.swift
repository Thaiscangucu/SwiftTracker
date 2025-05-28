import Foundation
import CoreData

class ContentViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func getProduct() {
        products = CoreDataController.shared.fetchAllProducts()
    }
    
    func createProduct(id: UUID, name: String, priceBuy: Double, priceSell: Double, stock: Int64) {
        let result = CoreDataController.shared.createProduct(id: id, name: name, priceBuy: priceBuy, priceSell: priceSell, stock: stock)
        self.products.append(result)
    }
    
    func deleteProduct(_ product: Product) {
        CoreDataController.shared.deleteProduct(product)
    }
}
