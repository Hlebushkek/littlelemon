//
//  Dish+Extension.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import CoreData

enum DishCategory: String, CaseIterable, Identifiable {
    case starter
    case main
    case dessert
    case side
    case drink
    
    var id: String { rawValue }
}

extension Dish {
    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            guard let _ = exists(name: menuItem.title, context) else {
                continue
            }
            
            let oneDish = Dish(context: context)
            oneDish.name = menuItem.title
            if let price = Float(menuItem.price) {
                oneDish.price = price
            }
            oneDish.dishDescription = menuItem.description
            oneDish.image = menuItem.image
        }
    }
    
    static func exists(name: String,
                       _ context:NSManagedObjectContext) -> Bool? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish]
            else {
                return nil
            }
            return results.count > 0
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
