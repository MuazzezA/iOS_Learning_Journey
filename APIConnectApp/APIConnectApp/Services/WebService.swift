//
//  WebService.swift
//  APIConnectApp
//
//  Created by Muazzez Aydın on 19.08.2023.
//

import Foundation

let BASEURL = "https://jsonplaceholder.typicode.com/posts"

class WebService: Codable {
    
    static let shared = WebService()
    
    func getPostData(with urlString:String, completion: @escaping (Result<[PostModel], Error>) -> () ) {
        
        guard let url = URL(string: urlString) else {
            //fatalError("error in url")
            completion(.failure(NSError(domain: "hata var", code: 0)))
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if error != nil{
                // error
                completion(.failure(NSError(domain: "hata var", code: 1)))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                // hata
                completion(.failure(NSError(domain: "hata var", code: 2)))
             
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode([PostModel].self, from: data!)
                completion(.success(decodedData))
                //onSucces(decodedData)
            }catch {
                completion(.failure(NSError(domain: "hata var", code: 3)))
                return
                // error
            }
        }.resume()
    }
    
}
