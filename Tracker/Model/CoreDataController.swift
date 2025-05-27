import CoreData
import Foundation

//This class is responsable to acess the model
class CoreDataController: ObservableObject {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Product")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    func createProduct(id: Int64, name: String, priceBuy: Double, priceSell: Double, stock: Int64) -> Product {
        let product = Product(context: viewContext)
        
        product.id = id
        product.name = name
        product.priceBuy = priceBuy
        product.priceSell = priceSell
        product.stock = stock
        
        saveContext()
        return product
        
    }
    
    func fetchAllProducts() -> [Product] {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching Products: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteProduct(_ product: Product){
        viewContext.delete(product)
        saveContext()
    }
    
    
}
