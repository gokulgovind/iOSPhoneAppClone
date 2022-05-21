//
//  FavouriteContactModel.swift
//  iOSPhoneAppClone
//
//  Created by Gokul on 21/05/22.
//

import Foundation


struct FavouriteContactModel {
    var id = UUID()
    var contactName:String
    var contactLabel:String
    var contactImage:String?
}

extension FavouriteContactModel {
    static var mockData:[FavouriteContactModel] {
        return [
            FavouriteContactModel(contactName: "Rakesh", contactLabel: "office", contactImage: "user_1"),
            FavouriteContactModel(contactName: "Dad", contactLabel: "phone", contactImage: nil),
            FavouriteContactModel(contactName: "Mom", contactLabel: "office", contactImage: nil),
            FavouriteContactModel(contactName: "Albert", contactLabel: "phone", contactImage: "user_2"),
            FavouriteContactModel(contactName: "Bae🐝", contactLabel: "home", contactImage: "mycard_placeholder")
        ]
    }
}
