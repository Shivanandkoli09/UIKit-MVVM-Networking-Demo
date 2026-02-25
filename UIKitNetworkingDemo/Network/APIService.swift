//
//  APIService.swift
//  UIKitNetworkingDemo
//
//  Created by Shivanand Koli on 25/02/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPeople() async throws -> [Person]
}

final class APIService: APIServiceProtocol {
    
    func fetchPeople() async throws -> [Person] {
        
        guard let url = URL(string: "https://swapi.info/api/people") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decoded = try JSONDecoder().decode([Person].self, from: data)
        return decoded
    }
}
