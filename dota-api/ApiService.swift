//
//  ApiService.swift
//  dota-api
//
//  Created by Candra Winardi on 24/11/22.
//

import Foundation

class ApiService: ObservableObject {
    @Published var heros: [heroModel] = []
    
    func fetch(){
        guard let url = URL(string: api_url) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let heros = try JSONDecoder().decode([heroModel].self, from: data)
                DispatchQueue.main.async {
                    self?.heros = heros
                }
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
