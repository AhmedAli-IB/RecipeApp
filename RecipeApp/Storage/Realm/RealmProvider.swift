//
//  RealmProvider.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 29/03/2021.
//

import Foundation
import RealmSwift

// MARK: - RealmProvider
//
public struct RealmProvider {

    // MARK: - Stored Properties
    
    let configuration: Realm.Configuration

    // MARK: - Init
    
     init(config: Realm.Configuration) {
        configuration = config
        print("Realm URL: \(String(describing: configuration.fileURL))")
    }

    // MARK: - Properties
    
    private var realm: Realm? {
        do {
            return try Realm(configuration: configuration)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    // MARK: - Configuration
    
    private static let defaultConfig = Realm.Configuration(schemaVersion: 1)
    private static let mainConfig = Realm.Configuration(
        fileURL: URL.inDocumentsFolder(fileName: "main.realm"),
        schemaVersion: 1)

    // MARK: - Realm Instances
    
    public static var `default`: Realm? = {
        return RealmProvider(config: RealmProvider.defaultConfig).realm
    }()
    
    public static var main: Realm? = {
        return RealmProvider(config: RealmProvider.mainConfig).realm
    }()
}

private extension URL {
    // returns an absolute URL to the desired file in documents folder
    static func inDocumentsFolder(fileName: String) -> URL {
        return URL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0],
                   isDirectory: true)
            .appendingPathComponent(fileName)
    }
}
