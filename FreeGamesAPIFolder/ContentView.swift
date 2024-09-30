//
//  ContentView.swift
//  FreeGames
//
//  Created by Turma01-15 on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var showingSheet = false
    @State var title = ""
    @State var thumb = ""
    @State var desc = ""
    @State var genre = ""
    @State var platform = ""
    @State var publisher = ""

    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.pastel, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    VStack{
                        HStack{
                            Image(systemName: "moon.stars")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            Text("FREE GAMES INFO")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Spacer()
                            Image(systemName: "moon.stars")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.trailing)
                            
                        }
                        AsyncImage(url: URL(string: "https://sm.ign.com/ign_br/screenshot/default/boxart-final3-preview0_swvw.jpg")) { image in
                            image
                                .resizable()
                                .frame(width:350, height: 200)
                        } placeholder: {
                            Color.gray
                        }
                    ScrollView{
                        HStack{
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        HStack{
                            VStack{
                                    ForEach(viewModel.chars){
                                        index in
                                        HStack{
                                            AsyncImage(url: URL(string: index.thumbnail!)) { image in
                                                image
                                                    .resizable()
                                                    .frame(width:200, height: 100)
                                            } placeholder: {
                                                Color.gray
                                            }
                                            Text(index.title!)
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            Spacer()
                                        }
                                        .onTapGesture {
                                            showingSheet.toggle()
                                            title = index.title!
                                            desc = index.short_description!
                                            thumb = index.thumbnail!
                                            genre = index.genre!
                                            publisher = index.publisher!
                                            platform=index.platform!
                                        }
                                        .sheet(isPresented: $showingSheet)
                                        {print("Sheet dismissed")}content:{
                                            VStack{
                                                Text(title)
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                                    .padding(.top)
                                                AsyncImage(url: URL(string: thumb)) { image in
                                                    image
                                                        .resizable()
                                                        .frame(width:350, height: 200)
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                Text(desc)
                                                    .padding()
                                                    .font(.subheadline)
                                                Text("Genre: \(genre)")
                        
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                Text("Platform: \(platform)")
                        
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                Text("Publisher: \(publisher)")
                                                
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                Spacer()
                                                
                                            }
                                        }
                                    }
                                    .padding(.top, 20)
                                }
                            }
                        }.padding(.horizontal)
                }
                }
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
