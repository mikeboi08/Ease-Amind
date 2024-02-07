//
//  TestingSound.swift
//  EASE-AMIND
//
//  Created by Dante Parker on 1/31/24.
//

import SwiftUI
import AVKit
var zipSoundEffect: AVAudioPlayer?

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    // Enum holds multiple types of sounds to be parsed through playSound Function
    enum SoundOption: String {
        case Zipper
        case BackpackZip
        case PencilZip
    }
    
    //Creates path that gets sound to play
    func playSound(sound: SoundOption) { //sound: SoundOption create variable for the enum for forResource input
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3")
        else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct TestingSound: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Play Sound") { //calls upon SoundManager class to play sounds
                SoundManager.instance.playSound(sound: .Zipper)
            }
            Button("Play Sound") {
                SoundManager.instance.playSound(sound: .BackpackZip)
            }
            Button("Play Sound") {
                SoundManager.instance.playSound(sound: .PencilZip)
            }
        }
        Text("BIG BOY SOUND")
    }
}

#Preview {

    TestingSound()
}
