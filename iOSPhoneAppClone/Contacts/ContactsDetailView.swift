//
//  ContactsDetailView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI
import Contacts

struct ContactsDetailView: View {
    var contactinfo:CNContact?
    
    init(contactinfo:CNContact?) {
        self.contactinfo = contactinfo
        UITableView.appearance().sectionHeaderHeight = 0
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                contactOptionView
                formView
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {

                    }
                }
            }
            
        }
    }
    
    private var headerView: some View {
        VStack {
            Text("ABC")
                .frame(width: 100, height: 100, alignment: .center)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(Color.white)
                .font(Font.title)
                
            Text(contactinfo?.getDisplayName ?? "User Name")
        }
        
    }
    
    private var contactOptionView: some View {
        HStack {
            VStack {
                Image(systemName: "message.fill")
                Text("message")
            }
            
            .frame(maxWidth:.infinity, maxHeight: 60)
            .background(Color.red)
            .cornerRadius(8)

            VStack {
                Image(systemName: "phone.fill")
                Text("call")
            }
            .frame(maxWidth:.infinity, maxHeight: 60)
            .background(Color.white)
            .cornerRadius(8)
            

            VStack {
                Image(systemName: "video.fill")
                Text("video")
            }
            .frame(maxWidth:.infinity, maxHeight: 60)
            .background(Color.white)
            .cornerRadius(8)

            VStack {
                Image(systemName: "envelope.fill")
                Text("mail")
            }
            .frame(maxWidth:.infinity, maxHeight: 60)
            .background(Color.white)
            .cornerRadius(8)
        }
        .listStyle(.grouped)
    }
    
    var formView: some View {
        Form {
            Section {
                if let phoneNumber = contactinfo?.phoneNumbers {
                    ForEach(phoneNumber, id: \.self) { result in
                        VStack(alignment: .leading) {
                            if let label = result.label {
                                let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
                                Text(localizedLabel)
                            }
                            Text(result.value.stringValue)
                                .foregroundColor(Color.blue)
                        }
                        .padding(8)
                    }
                }
                
            }
            
            Section() {
                VStack {
                    Text("Notes")
                    Spacer(minLength: 70)
                }
            }
            
            Section() {
                Button("Send Message") {
                    
                }
                
                Button("Share Contact") {
                    
                }
                
                Button("Add to Favourites") {
                    
                }
            }
            
            Section() {
                Button("Add to Emergency Contacts") {
                    
                }
            }
            
            Section() {
                Button("Share My Location") {
                    
                }
            }
            
            Section() {
                Button("Block this Caller") {
                    
                }
                .foregroundColor(Color.red)
            }
            
        }
        
    }
}

struct ContactsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetailView(contactinfo: nil)
    }
}
