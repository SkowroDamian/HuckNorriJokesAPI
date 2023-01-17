//
//  ViewModelHNJ.swift
//  HuckNorrisJokesAPI
//
//  Created by Damian Skowroński on 17/01/2023.
//

import Foundation

struct Joke: Hashable, Codable {
    let created_at: String
    let icon_url: String
    let id: String
    let url: String
    let value: String
}


class ViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    
    
    func fetch() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(String(describing: json)) //debug
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                print(String(describing: joke)) //debug
                DispatchQueue.main.async {
                    self?.jokes.append(joke)
                }
                
            } catch {
                print(error)
            }
            
            
        }
        task.resume()
    }
}
