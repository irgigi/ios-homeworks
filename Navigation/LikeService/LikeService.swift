//
//  LikeService.swift
//  Navigation


import CoreData

final class LikeService {
    
    private let coreDataService: ICoreDataService = CoreDataService.shared
    
    private var db = [DataBaseModel]()
    
    func fetchList(completion: @escaping ([DataBaseModel]) -> Void) {
//      like  DispatchQueue.global().async {
        coreDataService.backgroundContext.perform { [weak self] in
            guard let self else { return }
            let request = DataBaseModel.fetchRequest()
            
            do {
                db = try coreDataService.backgroundContext.fetch(request).map { $0 }
                //       like DispatchQueue.main.async {
                coreDataService.mainContext.perform { [weak self] in
                    guard let self else { return }
                    completion(db)
                }
            } catch {
                print(error)
                db = []
                completion(db)
            }
        }
    }
    
    func fetchItems(authorName: String, completion: @escaping ([DataBaseModel]) -> Void) {
        coreDataService.backgroundContext.perform { [weak self] in
            guard let self else { return }
            let request = DataBaseModel.fetchRequest()
            // filter
            request.predicate = NSPredicate(format: "author == %@", authorName)
            
            do {
                db = try coreDataService.backgroundContext.fetch(request).map { $0 }
                coreDataService.mainContext.perform { [weak self] in
                    guard let self else { return }
                    completion(db)
                }
            } catch {
                print(error)
                completion(db)
            }
        }
    }
    
    func clearFilter(completion: @escaping ([DataBaseModel]) -> Void) {
        coreDataService.backgroundContext.perform { [weak self] in
            guard let self else { return }
            let request = DataBaseModel.fetchRequest()
            // clear filter
            request.predicate = nil
            
            do {
                db = try coreDataService.backgroundContext.fetch(request).map { $0 }
                coreDataService.mainContext.perform { [weak self] in
                    guard let self else { return }
                    completion(db)
                }
            } catch {
                print(error)
                completion(db)
            }
        }
    }
    
    func saveObject(with author: String, text: String, image: String, likes: String, views: String, completion: @escaping ([DataBaseModel]) -> Void) {
        coreDataService.backgroundContext.perform { [weak self] in
            guard let self else { return }
            
            let dbModel = DataBaseModel(context: coreDataService.backgroundContext)
            dbModel.author = author
            dbModel.text = text
            dbModel.image = image
            dbModel.likes = likes
            dbModel.views = views
            
            if coreDataService.backgroundContext.hasChanges {
                do {
                    try coreDataService.backgroundContext.save()
                    coreDataService.mainContext.perform { [weak self] in
                        guard let self else { return }
                        db.insert(dbModel, at: 0)
                        completion(db)
                    }
                } catch {
                    coreDataService.mainContext.perform { [weak self] in
                        guard let self else { return }
                        completion(db)
                    }
                }
            }
        }
    }
    
    func delete(_ dbModel: DataBaseModel, completion: @escaping ([DataBaseModel]) -> Void) {
        coreDataService.backgroundContext.perform { [weak self] in
            guard let self else { return }
            coreDataService.backgroundContext.delete(dbModel)
             
            do {
                try coreDataService.backgroundContext.save()
                db.removeAll(where: { $0.id == dbModel.id })
                coreDataService.mainContext.perform { [weak self] in
                    guard let self else { return }
                    completion(db)
                }
            } catch {
                print(error)
                coreDataService.mainContext.perform { [weak self] in
                    guard let self else { return }
                    completion(db)
                }
            }
        }
    }

}
