//
//  player.swift
//  Spotify2
//
//  Created by Turma01-15 on 24/09/24.
//

import SwiftUI
import AVFoundation
import Foundation
struct player: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    @State var name: String = "Human Nature"
    @State var artist: String = "Madonna"
    @State var capa: String = "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"
    class AudioManager {
        static let shared = AudioManager()
        
        var audioPlayer: AVAudioPlayer?
        var isPlaying: Bool {
            return audioPlayer?.isPlaying ?? false
        }
        var playbackPosition: TimeInterval = 0
        
        func playSound(named name: String) {
            guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
                print("Sound file not found")
                return
            }
            
            do {
                if audioPlayer == nil || !isPlaying {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.currentTime = playbackPosition
                    audioPlayer?.prepareToPlay()
                    audioPlayer?.play()
                } else {
                    print("Sound is already playing")
                }
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
        
        func stopSound() {
            if let player = audioPlayer {
                playbackPosition = player.currentTime
                player.stop()
            }
        }
    }
    var body: some View {
        ZStack{
            VStack {
                LinearGradient(gradient: Gradient(colors: [ .madonna, .black]), startPoint: .top, endPoint: .bottom)
            }
            .edgesIgnoringSafeArea(.all)
            VStack{
                AsyncImage(url: URL(string: capa)) { image in
                    image
                        .resizable()
                        .frame(width:350, height: 350)
                } placeholder: {
                    Color.gray
                }
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text(artist)
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
                HStack{
                    Spacer()
                    Image(systemName: "shuffle")
                        .resizable()
                        .frame(width:20, height:20)
                        .foregroundStyle(.white)
    
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width:20, height:20)
                        .foregroundStyle(.white)
                    Button(action: {
                        
                            audioPlayerViewModel.playOrPause()
                          }) {
                            Image(systemName: audioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
                              .resizable()
                              .frame(width: 64, height: 64)
                          }
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width:20, height:20)
                        .foregroundStyle(.white)
                    Image(systemName: "repeat")
                        .resizable()
                        .frame(width:20, height:20)
                        .foregroundStyle(.white)
                    Spacer()
                    

                }
            }
        }
        
        
    }
}

#Preview {
    player()
}
