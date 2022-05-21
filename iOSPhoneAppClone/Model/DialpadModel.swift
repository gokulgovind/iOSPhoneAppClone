//
//  DialpadModel.swift
//  iOSPhoneAppClone
//
//  Created by Gokul on 21/05/22.
//

import Foundation



struct DialPadModel: Hashable, Identifiable {
    var id = UUID()
    var dialNumber: String
    var dialValue: String
}
