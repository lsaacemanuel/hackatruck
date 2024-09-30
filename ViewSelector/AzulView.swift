//
//  AzulView.swift
//  Desafio1NStack
//
//  Created by Turma01-15 on 23/09/24.
//

import SwiftUI

struct AzulView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .edgesIgnoringSafeArea(.top)
            Circle()
                .fill(.black)
                .frame(width:300, height: 300)
            Image(systemName: "paintbrush.pointed")
                .resizable()
                .frame(width:220, height: 220)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    AzulView()
}
