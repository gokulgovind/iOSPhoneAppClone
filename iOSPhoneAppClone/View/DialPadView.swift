//
//  DiapPadView.swift
//  PhoneAppClone
//
//  Created by Gokul on 03/05/22.
//

import SwiftUI

struct DialPadView: View {
    @State var dialedNumber:String = ""
    
    var dialInput = [
        [
            DialPadModel(dialNumber: "1", dialValue: ""),
            DialPadModel(dialNumber: "2", dialValue: "ABC"),
            DialPadModel(dialNumber: "3", dialValue: "DEF")],
        
        [
            DialPadModel(dialNumber: "4", dialValue: "GHI"),
            DialPadModel(dialNumber: "5", dialValue: "JKL"),
            DialPadModel(dialNumber: "6", dialValue: "MNO")],
        [
            DialPadModel(dialNumber: "7", dialValue: "PQRS"),
            DialPadModel(dialNumber: "8", dialValue: "TUV"),
            DialPadModel(dialNumber: "9", dialValue: "WXYZ")],
        [
            DialPadModel(dialNumber: "*", dialValue: ""),
            DialPadModel(dialNumber: "0", dialValue: "+"),
            DialPadModel(dialNumber: "#", dialValue: "")]]
    
    var body: some View {
        VStack {
            Spacer()
            TextField("", text: $dialedNumber, prompt: nil)
                .font(Font.largeTitle)
                .multilineTextAlignment(.center)
            if (dialedNumber.count) != 0 {
                Button("Add Number") {
                    
                }
            }
            Spacer()
            VStack(alignment: .center, spacing: 20) {
                ForEach(dialInput, id: \.self) { rowValues in
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(rowValues, id: \.id) { value in
                            Button() {
                                dialedNumber += value.dialNumber
                            } label: {
                                VStack(spacing: 0) {
                                    Text(value.dialNumber)
                                        .foregroundColor(Color("dialpad_fg"))
                                        .font(.largeTitle)
                                    Text(value.dialValue)
                                        .foregroundColor(Color("dialpad_fg"))
                                        .font(.caption2)
                                }
                                
                                .frame(width: 80, height: 80, alignment: .center)
                                .background(Color("dialpad_bg"))
                                .cornerRadius(40)
                            }
                        }
                    }
                }
                
                HStack {
                    Button() {
                        
                    } label: {
                        Image(systemName:"phone.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 80, height: 80, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(.leading,(dialedNumber.count) != 0  ? 60 : 0)
                    
                    if (dialedNumber.count) != 0 {
                        Button() {
                            dialedNumber = String(dialedNumber.dropLast())
                        } label: {
                            Image(systemName:"delete.backward.fill")
                                .resizable()
                                .frame(width: 25, height: 20, alignment: .center)
                                .foregroundColor(Color("dialpad_bg"))
                                .padding(.leading, 30)
                        }
                        
                    }
                }
                
            }
        }
        .padding(.bottom, 20)
    }
    
    var rowView: some View {
        Text("")
    }
}

struct DialPadView_Previews: PreviewProvider {
    static var previews: some View {
        DialPadView()
            .preferredColorScheme(.light)
    }
}
