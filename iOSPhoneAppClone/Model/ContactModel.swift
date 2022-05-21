//
//  ContactModel.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import Foundation


struct ContactGrouped {
    var sectionHeader:String
    var contact:ContactModel
}


struct ContactModel {
    var firstName:String
    var lastName:String
    var identifier:String
}
