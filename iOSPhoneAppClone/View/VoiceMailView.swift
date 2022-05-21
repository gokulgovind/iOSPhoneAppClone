//
//  VoiceMailView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI

struct VoiceMailView: View {
    var body: some View {
        NavigationView {
            Text("Call Voicemail")
                .padding(.vertical, 4)
                .padding(.horizontal, 26)
                .foregroundColor(Color.secondary)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.secondary, lineWidth: 1)
                )
                .navigationTitle("Voicemail")
        }
    }
}

struct VoiceMailView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMailView()
    }
}
