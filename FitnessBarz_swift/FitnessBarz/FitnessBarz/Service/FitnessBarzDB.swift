//
//  FitnessBarzDB.swift
//  FitnessBarz
//
//  Created by Charles on 2018/11/5.
//  Copyright © 2018年 Charles. All rights reserved.
//

import CoreData
import Foundation
import UIKit

class FitnessBarzDB: NSObject {
    
    static let shared: FitnessBarzDB = {
        let singleton = FitnessBarzDB()
        //let moc:NSManagedObjectContext = UIApplication.shared.delegate.manage
        let internalQueue: DispatchQueue = DispatchQueue(label:"DBQueue")
        NotificationCenter.default.addObserver(forName: NSNotification.Name.NSManagedObjectContextDidSave, object: nil, queue: nil, using: { (notification:Notification) in
            singleton.internalQueue.sync {
                if let _ = notification.object {
                    let context = notification.object as! NSManagedObjectContext
                    if (context.persistentStoreCoordinator == singleton.moc.persistentStoreCoordinator && context != singleton.moc) {
                        singleton.moc.mergeChanges(fromContextDidSave: notification)
                    }
                }
            }
        })
        return singleton
    } ()
    
    let moc:NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let internalQueue: DispatchQueue = DispatchQueue(label:"DBQueue")
    
}

extension FitnessBarzDB {
    
    func insert (wrapUpEntity: (_ context: NSManagedObjectContext) -> ()) {
        runWithPrivateContext { (context) in
            wrapUpEntity(context)
            do {
                try context.save()
            } catch {
                fatalError("\(error)")
            }
        }
    }
    
    func fetch<T>(type: T.Type, predicate: NSPredicate?, sort: [NSSortDescriptor]?, wrapUpData:(_ entities:[T]) -> ()){
        runWithPrivateContext { (context) in
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
            request.predicate = predicate
            request.sortDescriptors = sort
            
            do {
                let results = try context.fetch(request) as! [T]
                wrapUpData(results)
            } catch {
                fatalError("\(error)")
            }
        }
    }
    
    func update<T>(type: T.Type, wrapUpData: ((_ entities: [T]) -> ())) {
        runWithPrivateContext { (context) in
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
            do {
                let results = try context.fetch(request) as! [T]
                wrapUpData(results)
                try context.save()
            } catch {
                fatalError("\(error)")
            }
        }
    }
    
    func deleteAll<T: NSManagedObject>(_ type: T.Type) {
        runWithPrivateContext { (context) in
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
                let results = try context.fetch(fetchRequest) as! [T]
                for result in results {
                    context.delete(result)
                }
                
                try context.save()
            } catch {
                fatalError("\(error)")
            }
        }
    }
    
    func delete<T: NSManagedObject>(_ type: T.Type, with predicate: NSPredicate) {
        runWithPrivateContext { (context) in
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
                fetchRequest.predicate = predicate
                
                let results = try context.fetch(fetchRequest) as! [T]
                for result in results {
                    context.delete(result)
                }
                
                try context.save()
            } catch {
                fatalError("\(error)")
            }
        }
    }
    
    private func runWithPrivateContext(block:(_ context: NSManagedObjectContext) -> ()) {
        let privateContext: NSManagedObjectContext = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        privateContext.undoManager = nil
        privateContext.persistentStoreCoordinator = moc.persistentStoreCoordinator
        privateContext.performAndWait {
            block(privateContext)
        }
    }
}
