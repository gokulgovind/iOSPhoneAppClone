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
                let dummy = ["Rakesh", "Bae", "Gokul"]
                ForEach(dummy, id: \.self) { contact in
                    FavouriteRow(name: contact)
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
    var name: String
    
    var body: some View {
        HStack {
            Image("mycard_placeholder")
                .resizable()
                .frame(maxWidth: 30, maxHeight: 30)
                .clipShape(Circle())
            

            VStack(alignment: .leading, spacing: 3) {
                Text(name)
                    .font(Font.headline)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName:"phone.fill")
                        .resizable()
                        .frame(width: 12, height: 12, alignment: .center)
                        .foregroundColor(Color.gray)
                    Text("phone")
                        .foregroundColor(Color.secondary)
                }
            }
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName:"info.circle")
                    .foregroundColor(Color.accentColor)
            })
        }
    }
}
