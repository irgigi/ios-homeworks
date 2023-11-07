//
//  LikeService.swift
//  Navigation


import CoreData

final class LikeService {
    
    private let coreDataService: ICoreDataService = CoreDataService.shared
    
    //private(set) var likeItems = [LikeModel]()
    private(set) var db = [DataBaseModel]()
    
    init() {
        fetchItems()
    }
    
    private func fetchItems() {
        
        let request = DataBaseModel.fetchRequest()
        do {
            db = try coreDataService.context.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func createItem(author: String, text: String, image: String, likes: String, views: String) {
        let newLike = DataBaseModel(context: coreDataService.context)
        newLike.author = author
        newLike.text = text
        newLike.image = image
        newLike.likes = likes
        newLike.views = views
        coreDataService.saveContext()
        fetchItems()
    }
    
    func fetchLike() -> [DataBaseModel] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DataBaseModel")
        do {
            return (try? coreDataService.context.fetch(fetchRequest) as? [DataBaseModel]) ?? []
        }
    }
    
    func deliteItem(at index: Int) {
        coreDataService.context.delete(db[index])
        coreDataService.saveContext()
        fetchItems()
    }
    
    
    
}
