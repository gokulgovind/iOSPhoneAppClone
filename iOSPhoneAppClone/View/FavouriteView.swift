//
//  FavouriteView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationView {
            List {
                let contacts = FavouriteContactModel.mockData
                ForEach(contacts, id: \.id) { contact in
                    FavouriteRow(contact: contact)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favourites")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
        
            
    }
    
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .large)
    }
}


struct FavouriteRow: View {
    var contact: FavouriteContactModel
    
    var body: some View {
        HStack {
            if let image = contact.contactImage {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .clipShape(Circle())
            }else{
                Text(String(contact.contactName.first!))
                    .frame(maxWidth: 35, maxHeight: 35)
                    .background(Color("name_placeholder_bg"))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            
            
            
            VStack(alignment: .leading, spacing: 3) {
                Text(contact.contactName)
                    .font(Font.headline)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName:"phone.fill")
                        .resizable()
                        .frame(width: 12, height: 12, alignment: .center)
                        .foregroundColor(Color.gray)
                    Text(contact.contactLabel)
                        .foregroundColor(Color.secondary)
                }
            }
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName:"info.circle")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .foregroundColor(Color.accentColor)
            })
        }
    }
    
}
