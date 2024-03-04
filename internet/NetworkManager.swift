//
//  NetworkManager.swift
//  internet
//
//  Created by swift on 04.03.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getJoke(completion: @escaping (Joke) -> Void) {
        
        let url = URL(string: "https://web.telegram.org/k/#-4049619270")
        
        let manager = URLSession.shared
        
        manager.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print (error)
            }
            let decoder = JSONDecoder()
            do {
                let joke = try decoder.decode(Joke.self, from: data!)
                completion(joke)
                
            } catch {
                print ("error")
            }
            
        } .resume()
        
        }
    }
    


struct Joke: Codable {
    var type: String
    var setup: String
    var punchline: String
    var id: Int
}
