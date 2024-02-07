//
//  SettingsView.swift
//  EASE-AMIND
//
//  Created by Dante Parker on 2/7/24.
//

import SwiftUI

struct Settings: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var soundIsOn: Bool
}

struct SettingsView: View {
    @State var soundIsOn = true
    
    var settingsOption: [Settings] = [
        Settings(name: "Vibrations", image: "music.note.list", soundIsOn: true),
        Settings(name: "Sound", image: "music.mic", soundIsOn: true),
        Settings(name: "Change The Background Color", image: "square.stack", soundIsOn: false),
    ]
    var body: some View {
        NavigationStack{
            Text("")
                .navigationTitle("Settings")
            VStack{
                List{
                    ForEach(settingsOption) {
                        option in
                        NavigationLink {
                            Text(option.name)
                        }label: {
                            Label(option.name, systemImage:option.image)
                        }
                    }
                }
                .listStyle(.inset)
            }
        }
    }
}

#Preview {
    SettingsView()
}
