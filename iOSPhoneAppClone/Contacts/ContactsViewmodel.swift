//
//  ContactsViewmodel.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import Foundation
import Contacts

class ContactsViewModel:ObservableObject {
    @Published var contacts = [CNContact]()
    
    func getContacts() {
        
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        let contactStore = CNContactStore()
        do {
            try contactStore.enumerateContacts(with: request) {
                (contact, stop) in
                // Array containing all unified contacts from everywhere
                self.contacts.append(contact)
            }
        }
        catch {
            print("unable to fetch contacts")
        }
    }
}
