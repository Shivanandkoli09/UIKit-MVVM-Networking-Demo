//
//  PeopleViewModel.swift
//  UIKitNetworkingDemo
//
//  Created by Shivanand Koli on 25/02/26.
//

import Foundation

@MainActor
final class PeopleViewModel {
    
    private let service: APIServiceProtocol
    
    var people: [Person] = []
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func fetchPeople() async {
        do {
            people = try await service.fetchPeople()
        } catch {
            print("Error: \(error)")
        }
    }
}
