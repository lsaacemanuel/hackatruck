//
//  ListView.swift
//  Desafio1NStack
//
//  Created by Turma01-15 on 23/09/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush")
                    }
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush.pointed")
                    }
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintpalette")
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("List")
        }
    }
}

#Preview {
    ListView()
}
