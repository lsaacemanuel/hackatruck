//
//  ContentView.swift
//  Spotify2
//
//  Created by Turma01-15 on 24/09/24.
//

import SwiftUI
import AVFoundation
struct Song: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa: String
}
var arrayMusicas = [
    Song(id: 1, name: "Survival", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 2, name: "Secret", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 3, name: "I'd Rather Be Your Lover", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 4, name: "Don't Stop", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 5, name: "Inside of Me", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 6, name: "Human Nature", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 7, name: "Forbidden Love", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 8, name: "Love Tried to Welcome Me", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 9, name: "Sanctuary", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 10, name: "Bedtime Story", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png"),
    Song(id: 11, name: "Take a Bow", artist: "Madonna", capa: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png")
]

class AudioPlayerViewModel: ObservableObject {
  var audioPlayer: AVAudioPlayer?

  @Published var isPlaying = false

  init() {
    if let sound = Bundle.main.path(forResource: "PocketCyclopsLvl1", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
      } catch {
        print("AVAudioPlayer could not be instantiated.")
      }
    } else {
      print("Audio file could not be found.")
    }
  }

  func playOrPause() {
    guard let player = audioPlayer else { return }

    if player.isPlaying {
      player.pause()
      isPlaying = false
    } else {
      player.play()
      isPlaying = true
    }
  }
}
struct ContentView: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    LinearGradient(gradient: Gradient(colors: [ .madonna, .black]), startPoint: .top, endPoint: .bottom)
                }
                .edgesIgnoringSafeArea(.all)
                VStack{
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png")) { image in
                        image
                            .resizable()
                            .frame(width:250, height: 250)
                    } placeholder: {
                        Color.gray
                    }
                    VStack{
                            HStack{
                                Text("Bedtime Stories")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.leading)
                                Spacer()
                            }
                        ScrollView{
                            HStack{
                                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/en/1/16/Bedtime_Stories_Madonna.png")) { image in
                                    image
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width:30, height: 20)
                                } placeholder: {
                                    Color.gray
                                }
                                .padding(.leading)
                                Text("Madonna")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                            }
                            HStack{
                                Text("Álbum - 1994")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color.grey)
                                    .padding(.leading, 15)
                                Spacer()
                            }
                            ForEach(arrayMusicas){
                                item in
                                HStack{
                                    AsyncImage(url: URL(string: item.capa)) { image in
                                        image
                                            .resizable()
                                            .frame(width:50, height: 50)
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .padding(.leading)
                                    VStack{
                                        HStack{
                                            NavigationLink(destination: player(name: item.name, artist: item.artist, capa: item.capa)){
                                                Text(item.name)
                                                    .foregroundColor(Color.white)
                                                Spacer()
                                            }
                                        }
                                        HStack{
                                            Text(item.artist)
                                                .foregroundColor(Color.grey)
                                            Spacer()
                                        }
                                    }
                                Spacer()
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(.white)
                                        .padding(.trailing)
                            }
                            }
                            VStack{
                                HStack{
                                    Text("Sugeridos")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .padding(.leading)
                                    Spacer()
                                }
                                ScrollView(.horizontal){
                                    HStack{
                                        VStack{
                                            AsyncImage(url: URL(string: "https://arquivos.consultoriadorock.com/content/2016/12/Madonna-Erotica-capa.jpg")) { image in
                                                image
                                                    .resizable()
                                                    .frame(width:200, height: 200)
                                            } placeholder: {
                                                Color.gray
                                            }
                                            Text("Erotica")
                                                .font(.caption)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                        }
                                        VStack{
                                            AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/pt/0/08/Madonna_-_Like_a_Prayer_album.png")) { image in
                                                image
                                                    .resizable()
                                                    .frame(width:200, height: 200)
                                            } placeholder: {
                                                Color.gray
                                            }
                                            Text("Like a Prayer")
                                                .font(.caption)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                        }
                                    }
                                    .padding(.leading)
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
