//
//  RealmStorage.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation
import RealmSwift

class RealmStorage {
    
    private let realm: Realm
    
    init(realm: Realm? = RealmProvider.default) {
        guard let realm = realm else {
            fatalError("Unable to launch realm!")
        }
        
        self.realm =  realm
    }
}

extension RealmStorage: StorageType {
    
    func allObjects<T>(ofType type: T.Type,
                       matching predicate: NSPredicate? = nil/*, sorted: Sorted??*/) -> [T] where T: Object {
        var objects = realm.objects(type)
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        
        return objects.compactMap { $0 }
    }
    
    func insertNewObject<T>(object: T) throws where T: Object {
        try realm.write {
            realm.add(object)
        }
    }
    
    func countObjects<T>(ofType type: T.Type, matching predicate: NSPredicate?) -> Int where T: Object {
        return self.allObjects(ofType: type, matching: predicate).count
    }
    
    func deleteObject<T>(_ object: T) where T: Object {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch let error {
            print("error ...... is   \(print(error.localizedDescription))")
        }
    }
    
    func firstObject<T>(ofType type: T.Type, matching predicate: NSPredicate?) -> T? where T: Object {
        var objects = realm.objects(type)
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        return objects.first
    }
    
    func perform(_ closure: @escaping () -> Void) {
        do {
            try realm.write {
                closure()
            }
        } catch {
            print("error ...... is   \(print(error.localizedDescription))")
        }
    }
    
    func reset() throws {
        try realm.write {
            realm.deleteAll()
        }
    }
}

enum RealmError: Error {
    case eitherRealmIsNilOrNotRealmSpecificModel
}

extension RealmError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .eitherRealmIsNilOrNotRealmSpecificModel:
            return "eitherRealmIsNilOrNotRealmSpecificModel"
        }
    }
}
