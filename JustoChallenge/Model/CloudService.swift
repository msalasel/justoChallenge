//
//  CloudService.swift
//  JustoChallenge
//
//  Created by Miguel Elduque on 30/07/23.
//

import Foundation

struct CloudService {
    
    private static let publicAPIURLString = "https://randomuser.me/api/"
    
    public func fetchData(completion: @escaping(Result) -> Void) {
        guard let urlRequest = createURL() else {
            print("Bar URL")
            return
        }
       
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Results.self, from: jsonData)
                completion(decodedData.results[0])
            } catch {
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }
    
   private func createURL() -> URL? {
        return URL(string: CloudService.publicAPIURLString)
    }
}
