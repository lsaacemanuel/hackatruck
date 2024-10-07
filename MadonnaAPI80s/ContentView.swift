//
//  ContentView.swift
//  Madonna80s
//
//  Created by Turma01-15 on 02/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.mad, .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Madonna 80's albums:")
                        .padding(.bottom, 350)
                        .font(.custom("Copperplate", size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                VStack{
                    Image("madonna")
                        .resizable()
                        .frame(width: 410, height: 250)
                        .ignoresSafeArea()
                    Spacer()
                }
                ScrollView{
                    VStack{
                        ForEach(viewModel.chars){
                            index in
                            NavigationLink(destination: albumView(
                                name: index.nome!, singles: index.singles!, covers: index.covers!, musicas: index.musicas!, album: index.album!)){
                                HStack{
                                    AsyncImage(url: URL(string: index.album!)) { image in
                                        image
                                            .resizable()
                                            .frame(width:150, height: 150)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .padding(.trailing)
                                    HStack{
                                        Text(index.nome!)
                                            .font(.body)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color.black)
                                            .multilineTextAlignment(.leading)
                                            .padding(.trailing)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(.leading, 20)
                        }                    }
                }
                .padding(.top, 250)
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
