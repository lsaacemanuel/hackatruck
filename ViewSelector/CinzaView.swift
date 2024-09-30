//
//  CinzaView.swift
//  Desafio1NStack
//
//  Created by Turma01-15 on 23/09/24.
//

import SwiftUI

struct CinzaView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.gray)
                .edgesIgnoringSafeArea(.top)
            Circle()
                .fill(.black)
                .frame(width:300, height: 300)
            Image(systemName: "paintpalette")
                .resizable()
                .frame(width:220, height: 180)
                .foregroundStyle(.gray)
        }

    }
}

#Preview {
    CinzaView()
}
