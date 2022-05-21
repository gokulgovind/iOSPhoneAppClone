//
//  RecentContactModel.swift
//  iOSPhoneAppClone
//
//  Created by Gokul on 21/05/22.
//

import Foundation



struct RecentContactModel {
    
    enum CallType {
        case missed
        case received
        case dialed
    }
    var id = UUID()
    var contactName:String
    var callTime:String
    var callType: CallType
    var contactLabel:String
}

extension RecentContactModel {
    static var mockData:[RecentContactModel] {
        return [
            RecentContactModel(contactName: "Tim Cook", callTime: "10:30 AM", callType: .received, contactLabel: "phone"),
            RecentContactModel(contactName: "Bae 🐝", callTime: "10:00 AM", callType: .dialed, contactLabel: "phone"),
            RecentContactModel(contactName: "Mark Zuckerberg", callTime: "Yesterday", callType: .received, contactLabel: "phone"),
            RecentContactModel(contactName: "Arun", callTime: "Yesterday", callType: .missed, contactLabel: "phone"),
            RecentContactModel(contactName: "+91 7779876878", callTime: "Yesterday", callType: .received, contactLabel: "phone"),
            RecentContactModel(contactName: "David Taylor", callTime: "Yesterday", callType: .dialed, contactLabel: "phone"),
            RecentContactModel(contactName: "Anand Kumar (2)", callTime: "Yesterday", callType: .missed, contactLabel: "phone"),
            RecentContactModel(contactName: "Akka", callTime: "Yesterday", callType: .received, contactLabel: "phone"),
        ]
    }
}
