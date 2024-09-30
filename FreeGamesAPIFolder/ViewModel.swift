//
//  ViewModel.swift
//  FreeGames
//
//  Created by Turma01-15 on 30/09/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var chars : [Games] = []
    
    func fetch(){
        
        let task = URLSession.shared.dataTask(with: URL(string: "https://www.freetogame.com/api/games")!){
            data, _, error in
            do{
                self.chars = try JSONDecoder().decode([Games].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
