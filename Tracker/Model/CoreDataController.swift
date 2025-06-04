import CoreData
import Foundation

//MARK: - Control data persistence
class CoreDataController: ObservableObject {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Tracker")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
            
        }
    }
    
    //MARK: - Func that interacts with Product data
    
    /*Save after changing the content*/
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    /*Cerate product and saves it*/
    func createProduct(id: UUID, name: String, priceBuy: Double,  priceSell: Double, sold: Double, stock: Double) -> Product {
        let product = Product(context: viewContext)
        
        product.id = UUID()
        product.name = name
        product.priceBuy = priceBuy
        product.priceSell = priceSell
        product.sold = sold
        product.stock = stock
        
        saveContext()
        return product
        
    }
    
    /*Create sell log*/
    func CreateSell(product: Product)-> Sell{
        let sell = Sell(context: viewContext)
        
        sell.productId = product.id
        sell.id = UUID()
        sell.price = product.priceSell
        sell.date = Date.now
        
        return sell
    }
    
    
    
    /*Edidit product funcion*/
    func editProduct(product: Product, name: String, priceBuy: Double,  priceSell: Double, stock: Double)  {
        
        product.name = name
        product.priceBuy = priceBuy
        product.priceSell = priceSell
        product.stock = stock
        
        saveContext()
        
    }
    
    
    /*Search for products*/
    func fetchAllProducts() -> [Product] {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            saveContext()
            return result
        } catch {
            print("Error fetching Products: \(error.localizedDescription)")
            return []
        }
    }
    
    /*Search for sell Logs*/
    
    func fetchAllSells() -> [Sell]{
        let fetchRequest: NSFetchRequest<Sell> = Sell.fetchRequest()
        
        do {
            let resultSell = try viewContext.fetch(fetchRequest)
            saveContext()
            return resultSell
        } catch {
            print("Error fetching Products: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteProduct(_ product: Product){
        viewContext.delete(product)
        saveContext()
    }
    
    func deleteSell (){
        var sells = fetchAllSells()
        var orderdSells = sells.sorted(by: { $0.date?.compare($1.date!) == .orderedAscending })
        var lastSell = orderdSells.last!

        viewContext.delete(lastSell)
        saveContext()
    }
    
    /*Control the quantity of products*/
    func sellProduct(_ product: Product){
        if product.stock == 0 {
            print("Unable to Sell")
        }else{
            product.stock -= 1
            product.sold += 1
            CreateSell(product: product)
            saveContext()
        }
    }
    
    func undoSell(_ product: Product){
        if product.sold == 0 || product.stock == 0 {
            print("Unable to undo")
        }else{
            product.stock += 1
            product.sold -= 1
            deleteSell()
            saveContext()
        }
    }

}
