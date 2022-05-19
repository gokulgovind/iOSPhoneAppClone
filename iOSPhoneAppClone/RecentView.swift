//
//  RecentCalls.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI

struct RecentView: View {

    @State private var callType = 0

    var body: some View {
        NavigationView {
            let test = ["Bae", "Akka", "House Owner"]
            List {
                ForEach(test, id: \.self) { contact in
                    RecentListRow(contactName: contact, isMissedCall: contact == "Akka")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Recents")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $callType) {
                        Text("All")
                            .tag(0)
                        Text("Missed")
                            .tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        
                    }
                }
            }
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
            .preferredColorScheme(.light)
    }
}


struct RecentListRow: View {
    var contactName: String
    var isMissedCall:Bool
    var body: some View {
        HStack {
            if isMissedCall {
                Image(systemName: "phone.fill.arrow.up.right")
                    .resizable()
                    .frame(width: 16, height: 16, alignment: .center)
                    .foregroundColor(Color.secondary)
            }else{
                Image("")
                    .frame(width: 20)
            }
            
            
            VStack(alignment: .leading, spacing: 0) {
                Text(contactName)
                    .font(Font.headline)
                    .fontWeight(.semibold)
                
                Text("mobile")
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
            Text("10:30 AM")
                .foregroundColor(Color.secondary)
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 22, height: 22, alignment: .center)
                .foregroundColor(Color.accentColor)
        }
    }
}
