//
//  ContentView.swift
//  Desafio1NStack
//
//  Created by Turma01-15 on 23/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                TabView{
                    RosaView()
                        .tabItem{
                            Label("Rosa", systemImage: "paintbrush.fill")
                        }
                    AzulView()
                        .tabItem{
                            Label("Azul", systemImage: "paintbrush.pointed.fill")
                        }
                    CinzaView()
                        .tabItem{
                            Label("Cinza", systemImage: "paintpalette.fill")
                        }
                    ListView()
                        .tabItem{
                            Label("Lista", systemImage: "list.bullet")
                        }
                }

        }
        }
}

#Preview {
    ContentView()
}
