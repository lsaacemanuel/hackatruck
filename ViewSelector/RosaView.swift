//
//  RosaView.swift
//  Desafio1NStack
//
//  Created by Turma01-15 on 23/09/24.
//

import SwiftUI

struct RosaView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.pink)
                .edgesIgnoringSafeArea(.top)
            Circle()
                .fill(.black)
                .frame(width:300, height: 300)
            Image(systemName: "paintbrush")
                .resizable()
                .frame(width:220, height: 220)
                .foregroundStyle(.pink)
        }
    }
}

#Preview {
    RosaView()
}
