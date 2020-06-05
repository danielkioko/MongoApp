//
//  AppDelegate.swift
//  MongoApp
//
//  Created by Daniel Nzioka on 6/4/20.
//  Copyright © 2020 Daniel Nzioka. All rights reserved.
//

import UIKit
import CoreData
import StitchCore
import StitchRemoteMongoDBService

//Initialize Stitch App
let stitch = try! Stitch.initializeAppClient(withClientAppID: "stitch app name goes here")
var contatcsCollection: RemoteMongoCollection<Contact>!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mongoClient = try! stitch.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
        contatcsCollection = mongoClient.db("Your DB's name goes here").collection("Your Collection's name goes here", withCollectionType: Contact.self)
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    lazy var persistentContainer: NSPersistentCloudKitContainer = {

        let container = NSPersistentCloudKitContainer(name: "MongoApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

