//
//  albumView.swift
//  Madonna80s
//
//  Created by Turma01-15 on 02/10/24.
//

import SwiftUI

struct albumView: View {
        @State var name: String = "Human Nature"
        @State var singles: [String] = ["sim"]
        @State var covers: [String] = ["https://upload.wikimedia.org/wikipedia/en/1/17/LikeAVirgin1984.png"]
        @State var musicas: [String] = ["sim", "nao"]
        @State var album: String = "https://upload.wikimedia.org/wikipedia/en/1/17/LikeAVirgin1984.png"
        var i = 0
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.mad, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 750)
            }
            VStack{
                AsyncImage(url: URL(string: album)) { image in
                    image
                        .resizable()
                        .frame(width:300, height: 300)
                } placeholder: {
                    ProgressView()
                }
                .padding(.bottom, 300)
            }
            .padding(.bottom, 50)
            VStack{
                ScrollView{
                    HStack{
                        VStack{
                            ForEach(musicas, id: \.self){
                                index in
                                HStack{
                                    AsyncImage(url: URL(string: album)) { image in
                                        image
                                            .resizable()
                                            .frame(width:50, height: 50)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(index)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }
                        .padding(.leading)
                        Spacer()
                        ScrollView(.horizontal){
                            HStack{
                                ForEach( covers, id: \.self){
                                    index in
                                    AsyncImage(url: URL(string: index)) { image in
                                        image
                                            .resizable()
                                            .frame(width:150, height: 150)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                            .padding(.leading)
                            .padding(.bottom)
                        }
                    }
            }
            .padding(.top, 400)
        }
    }
}

#Preview {
    albumView()
}
