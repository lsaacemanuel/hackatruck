//
//  ContentView.swift
//  mapa
//
//  Created by Turma01-15 on 25/09/24.
//
import Foundation
import MapKit
import SwiftUI
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}
struct ContentView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)))
    
    var array = [Location(name: "Argentina",
                          coordinate: CLLocationCoordinate2D(latitude: -38.416097, longitude: -63.616672),
                          flag: "https://bandeira.net/wp-content/uploads/2018/08/bandeira-da-argentina.png",
                          description: "A Argentina é um país da América do Sul com uma área extensa que abrange montanhas dos Andes, lagos glaciais e pradarias nos Pampas, ocupadas tradicionalmente por seu famoso gado. O país é conhecido também por sua dança e sua música, o tango. A capital cosmopolita, Buenos Aires, tem como centro a Praça de Maio, cercada por edifícios imponentes do século XIX, como a Casa Rosada, o emblemático palácio presidencial."),
                 Location(name: "Canadá",
                          coordinate: CLLocationCoordinate2D(latitude: 56.130366, longitude: -106.346771),
                          flag: "https://bandeira.net/wp-content/uploads/2018/09/bandeira-do-canada.png",
                          description: "O Canadá é um país norte-americano que se estende desde os EUA, no sul, até o Círculo Polar Ártico, no norte. Entre suas grandes cidades estão a gigantesca Toronto; Vancouver, centro cinematográfico da costa oeste; Montreal e Québec City, que falam francês; e a capital, Ottawa. As vastas regiões de natureza selvagem do Canadá compreendem o Parque Nacional de Banff, repleto de lagos nas Montanhas Rochosas. Abriga também as Cataratas do Niágara, um famoso conjunto de enormes cachoeiras."),
                 Location(name: "Brasil",
                          coordinate: CLLocationCoordinate2D(latitude: -14.235004, longitude: -51.92528),
                          flag: "https://www.curitiba.pr.leg.br/atividade-parlamentar/legislacao/imagens/bandeira-do-brasil.png",
                          description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba.."),
                 Location(name: "Estados Unidos",
                          coordinate: CLLocationCoordinate2D(latitude: 37.09024, longitude: -95.712891),
                          flag: "https://bandeira.net/wp-content/uploads/2018/09/bandeira-dos-eua-estados-unidos-da-america.png",
                          description: "Os EUA são um país com 50 estados que cobrem uma vasta faixa da América do Norte, com o Alasca ao noroeste e o Havaí no Oceano Pacífico, estendendo a presença do país. As principais cidades da costa atlântica são Nova York, um centro financeiro e cultural global, e a capital, Washington, DC. Chicago, uma metrópole do centro-oeste, é conhecida por sua importante arquitetura, enquanto Los Angeles, na costa oeste, é famosa pelas produções cinematográficas de Hollywood."),
                 Location(name: "México",
                          coordinate: CLLocationCoordinate2D(latitude: 23.634501, longitude: -102.552784),
                          flag: "https://bandeira.net/wp-content/uploads/2018/09/bandeira-do-mexico.png",
                          description: "O México é um país situado entre os Estados Unidos e a América Central, conhecido pelas praias no Pacífico e no Golfo do México e pela paisagem diversificada que inclui montanhas, desertos e selvas. Ruínas antigas, como Teotihuacán e a cidade maia de Chichén Itzá, estão espalhadas pelo país, assim como cidades da era colonial espanhola. Na capital, Cidade do México, lojas elegantes, museus renomados e restaurantes gourmet atendem às necessidades da vida moderna."),
                 Location(name: "Uruguai",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             coordinate: CLLocationCoordinate2D(latitude: -32.522779, longitude: -55.765835),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             flag: "https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-uruguai.png",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             description: "O Uruguai é um país da América do Sul conhecido pelo interior verdejante e pelo litoral repleto de praias. A capital, Montevidéu, tem como ponto principal a Plaza Independencia, onde já existiu uma cidadela espanhola. Ela leva à Ciudad Vieja (Cidade Antiga), com edifícios art déco, casas coloniais e o Mercado del Puerto, um antigo mercado portuário com muitas churrascarias. La Rambla, um calçadão à beira-mar, passa por barracas de peixes, píeres e parques.")]
    @State var nome: String = ""
    @State var showingSheet = false
    @Environment(\.dismiss) var dismiss
    @State var cidade: String = ""
    @State var flag1: String = ""
    @State var description1: String = ""
    var body: some View {
            ZStack{
                VStack {
                    Map(position: $position)
                    {
                        ForEach(array){item in
                            Annotation(item.name, coordinate: item.coordinate) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.white)
                                    Image(systemName: "signpost.right")
                                        .onTapGesture {
                                            showingSheet.toggle()
                                            cidade=item.name
                                            flag1=item.flag
                                            description1=item.description
                                            
                                        }
                                        .sheet(isPresented: $showingSheet){print("Sheet dismissed")}content:{
                                            VStack{
                                                Text(cidade)
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color.black)
                                                    .padding(.vertical)
                                                AsyncImage(url: URL(string: flag1)) { image in
                                                    image
                                                        .resizable()
                                                        .frame(width:320, height: 200)
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                Text(description1)
                                                    .font(.system(size: 20)).multilineTextAlignment(.leading)
                                                    .padding([.top, .leading, .trailing])
                                                Spacer()              }
                                        }
                                        .padding(5)
                                }
                            }
                        }
                    }
                    .ignoresSafeArea()
                }
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(height: 150)
                            .edgesIgnoringSafeArea(.top)
                            .opacity(0.5)
                        Text("World Map")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 116)
                        Text(nome)
                            .padding(.bottom, 50)
                    }
                    Spacer()
                    ScrollView(.horizontal){
                        HStack{
                        ForEach(array){ item in
                                Button{
                                    nome=item.name
                                    position=MapCameraPosition.region(MKCoordinateRegion(
                                        center: item.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)))
                                } label: {AsyncImage(url: URL(string: item.flag)) { image in
                                    image
                                        .resizable()
                                        .frame(width:130, height: 80)
                                } placeholder: {
                                    Color.gray
                                }
                                }
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                }
            }

    }
}

#Preview {
    ContentView()
}
