//
//  ContentView.swift
//  mapaProjetoFinal
//
//  Created by Turma01-15 on 09/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting = false
    var body: some View {
        ZStack{
            TabView{
                mapa()
                    .tabItem{
                        Label("Mapa", systemImage: "map.fill")
                    }
            }
        }
    }
}
#Preview {
    ContentView()
}
