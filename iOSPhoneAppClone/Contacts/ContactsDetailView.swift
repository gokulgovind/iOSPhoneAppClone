//
//  ContactsDetailView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI
import Contacts

struct ContactsDetailView: View {
    var contactinfo:CNContact
    
    var body: some View {
        Text(contactinfo.givenName)
    }
}
