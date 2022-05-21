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

    var recentList = RecentModel.mockData
    
    var getRecentCallList:[RecentModel] {
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
    var contactInfo: RecentModel
    
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


struct RecentModel {
    
    enum CallType {
        case missed
        case received
        case dialed
    }
    var id = UUID()
    var contactName:String
    var callTime:String
    var callType: CallType
    var contactLabel:String
}

extension RecentModel {
    static var mockData:[RecentModel] {
        return [
            RecentModel(contactName: "Tim Cook", callTime: "10:30 AM", callType: .received, contactLabel: "phone"),
            RecentModel(contactName: "Bae 🐝", callTime: "10:00 AM", callType: .dialed, contactLabel: "phone"),
            RecentModel(contactName: "Mark Zuckerberg", callTime: "Yesterday", callType: .received, contactLabel: "phone"),
            RecentModel(contactName: "Arun", callTime: "Yesterday", callType: .missed, contactLabel: "phone"),
            RecentModel(contactName: "+91 7779876878", callTime: "Yesterday", callType: .received, contactLabel: "phone"),
            RecentModel(contactName: "David Taylor", callTime: "Yesterday", callType: .dialed, contactLabel: "phone"),
            RecentModel(contactName: "Anand Kumar (2)", callTime: "Yesterday", callType: .missed, contactLabel: "phone"),
            RecentModel(contactName: "Akka", callTime: "Yesterday", callType: .received, contactLabel: "phone"),
        ]
    }
}
