//
//  ViewModel.swift
//  Madonna80s
//
//  Created by Turma01-15 on 02/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var chars : [Madonna] = []
    
    func fetch(){
        
        let task = URLSession.shared.dataTask(with: URL(string: "http://127.0.0.1:1880/madGET")!){
            data, _, error in
            do{
                self.chars = try JSONDecoder().decode([Madonna].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
