//
//  TabView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI

struct TabarView: View {
    var body: some View {
        TabView {
            FavouriteView()
                .tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
                .navigationTitle("Favourites")
            RecentView()
                .tabItem {
                    Label("Recents", systemImage: "clock.fill")
                }
            ContactView(viewModel: ContactsViewModel())
                .tabItem {
                    Label("Contacts", systemImage: "person.circle.fill")
                }
            DialPadView()
                .tabItem {
                    Label("Keypad", systemImage: "keyboard")
                }
            VoiceMailView()
                .tabItem {
                    Label("Voicemail", systemImage: "phone.and.waveform.fill")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabarView()
    }
}
