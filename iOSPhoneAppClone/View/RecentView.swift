//
//  RecentCalls.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI

struct RecentView: View {

    @State private var callType = 0
    @State private var isEditList:Bool = false

    var recentList = RecentContactModel.mockData
    
    var getRecentCallList:[RecentContactModel] {
        if callType == 0 {
            return recentList
        }else{
            return recentList.filter { model in
                return model.callType == .missed
            }
        }
    }
    
    var body: some View {
        NavigationView {
            let contactInfo = getRecentCallList
            List {
                ForEach(contactInfo, id: \.id) { contact in
                    RecentListRow(contactInfo: contact)
                }.onDelete(perform: delete)
            }
            
            .listStyle(.plain)
            .navigationTitle("Recents")
            .toolbar {
                EditButton()
            }
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
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
//        recentList.remove(atOffsets: offsets)
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
            .preferredColorScheme(.light)
    }
}


struct RecentListRow: View {
    var contactInfo: RecentContactModel
    
    var body: some View {
        HStack {
            if contactInfo.callType == .dialed {
                Image(systemName: "phone.fill.arrow.up.right")
                    .resizable()
                    .frame(width: 16, height: 16, alignment: .center)
                    .foregroundColor(Color.secondary)
            }else{
                Text("")
                    .frame(width: 18)
            }
            
            
            VStack(alignment: .leading, spacing: 0) {
                Text(contactInfo.contactName)
                    .font(Font.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(contactInfo.callType == .missed ? .red : .black)
                
                Text(contactInfo.contactLabel)
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
            Text(contactInfo.callTime)
                .foregroundColor(Color.secondary)
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 22, height: 22, alignment: .center)
                .foregroundColor(Color.accentColor)
        }
    }
}

