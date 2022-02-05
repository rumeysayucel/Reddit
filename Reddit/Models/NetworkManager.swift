//
//  NetworkManager.swift
//  Reddit
//
//  Created by Rumeysa Yücel on 5.02.2022.
//

import Foundation

class NetworkManager : ObservableObject {
    @Published var posts = [Child]()
    func fetchData() {
        if let url = URL(string: "https://www.reddit.com/r/flutterdev/top.json?count=20#") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.data.children
                            }
                        } catch  {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
