//
//  iOSPhoneAppCloneApp.swift
//  iOSPhoneAppClone
//
//  Created by Gokul on 11/05/22.
//

import SwiftUI

@main
struct iOSPhoneAppCloneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabarView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
