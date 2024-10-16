//
//  ContentView.swift
//  mapaProjetoFinal
//
//  Created by Turma01-15 on 09/10/24.
//

import SwiftUI
import BottomSheet
import MapKit


struct ContentView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .absolute(150)
    @State var isPresenting = false
    @State var tabSelection = 0
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -9.413454, longitude: -40.513541),
            span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)))
    @State var positionX = 0
    @State var positionY = 0
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            TabView{
                ZStack{
                        Map(position: $position)
                        {
                            ForEach(viewModel.chars, id: \.self){
                                index in
                            Annotation("", coordinate: CLLocationCoordinate2D(latitude: index.LA!, longitude: index.LO!))
                            {
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 40, height: 40)
                                    Text(index.letra)
                                        .font(.title)
                                        .foregroundColor(Color.gray)
                                }
                                
                            }
                        }
                            Annotation("", coordinate: CLLocationCoordinate2D(latitude: -9.407602, longitude: -40.504877))
                            {
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 40, height: 40)
                                    Text("F")
                                        .font(.title)
                                        .foregroundColor(Color.gray)
                                }
                                .offset(x: CGFloat(positionX), y: CGFloat(positionY))
                                    .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true).speed(0.1))
                                    .onAppear(){
                                        positionX+=20
                                        positionY-=80
                                    }
                            }
                    }
                }
                .bottomSheet(
                    bottomSheetPosition: $bottomSheetPosition,
                    switchablePositions: [.absolute(150),
                                          .absolute(325), .relative(0.95)],
                    headerContent: {
                        
                    },
                    mainContent: {
                        ScrollView{
            
                            ForEach(viewModel.chars, id: \.self){ index in
                                HStack{
                                    VStack{
                                        HStack{
                                            ZStack{
                                                Circle()
                                                    .frame(width: 70, height: 70)
                                                    .foregroundColor(.white)
                                                Image(systemName: "bus.fill")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width: 30, height: 30)
                                            }
                                            
                                            VStack{                                             HStack{                              Text(index.nome)
                                                    .font(.headline)
                                                Spacer()
                                            }
                                                
                                                HStack{
                                                    Text("Avenida Monsenhor")
                                                    Spacer()
                                                }
                                            }
                                            
                                            
                                            Spacer()
                                            
                                        }
                                    }
                                    Spacer()
                                }
                                .onTapGesture {
                                    position=MapCameraPosition.region(MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: index.LA!, longitude: index.LO!),
                                        span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)))
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Rectangle()
                                    .padding()
                                    .frame(width: .infinity, height: 400)
                                    .foregroundColor(.pattern)
                                    .onTapGesture {
                                        print("foi")
                                        viewModel.fetch()
                                    }
                            }
                        }
                    })
                .tabItem{
                    Label("Mapa", systemImage: "map.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
                
                rotas()
                    .tabItem{
                        Label("Rotas", systemImage: "bus.fill")
                    }
                Itinerario()
                    .tabItem{
                        Label("Itinerarios", systemImage: "clock.badge")
                    }
                alertas()
                    .tabItem{
                        Label("Alertas", systemImage: "exclamationmark.brakesignal")
                    }
                preferencias()
                    .tabItem{
                        Label("Preferencias", systemImage: "person.fill.questionmark")
                    }
            }
            .animation(.spring(), value: tabSelection)
        }
        .onAppear(){
           
            viewModel.fetch()
            
        }
    }
}

#Preview {
    ContentView()
}

