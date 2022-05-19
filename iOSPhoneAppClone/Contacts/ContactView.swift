//
//  ContactView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI
import Contacts

struct ContactView: View {
    @StateObject var viewModel:ContactsViewModel
    @State var queryString:String = ""
    
    var body: some View {
        NavigationView {
                List {
                    Section {
                        MyCard
                            .frame(height: 80, alignment: .leading)
                    }
                    
                    Section {
                        ForEach(searchResult, id: \.identifier) { contact in
                            NavigationLink(destination: ContactsDetailView(contactinfo: contact)) {
                                Text(contact.getDisplayName)
                            }
                        }
                    }
                }
            
                .listStyle(.inset)
                .searchable(text: $queryString, placement: .navigationBarDrawer(displayMode: .always))
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Groups") {
                            
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear {
            viewModel.getContacts()
        }
    }
    
    var MyCard: some View {
        HStack {
            Image("mycard_placeholder")
                .cornerRadius(50)
            VStack(alignment: .leading) {
                Text("Gokul")
                Text("My Card")
            }
        }
    }
    
    var searchResult: [CNContact] {
        if queryString.isEmpty {
            return viewModel.contacts
        }
        return viewModel.contacts.filter {("\($0.givenName) \($0.middleName)  \($0.familyName) \($0.nameSuffix)").contains(queryString) }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(viewModel: ContactsViewModel())
    }
}
