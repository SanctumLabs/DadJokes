//
//  DadJokesNetworking.swift
//  DadJokesNetworking
//
//  Created by George Nyakundi on 18/02/2022.
//

import Foundation

class DadJokesNetworking {
    public static let shared = DadJokesNetworking()
    
    private let jsonDecoder = JSONDecoder()
    
    enum DadJokesServiceError: Error {
        case invalidRequest(String)
        case invalidURL(String)
        case forwared(Error)
        case invalidPayload(URL)
    }
    
    func fetchRandomJoke(
        using session: URLSession = .init(configuration: .default, delegate: nil, delegateQueue: .main), completionhandler: @escaping(Result<Jke, DadJokesServiceError>) -> Void) {
            session.request(.random) { data, _, error in
                guard error == nil else {
                    completionhandler(.failure(.forwared(error!)))
                    return
                }
                guard let jsonData = data else {
                    return
                }
                
                do {
                    let joke = try self.jsonDecoder.decode(Jke.self, from: jsonData)
                    completionhandler(.success(joke))
                } catch {
                    completionhandler(.failure(.forwared(error)))
                }
            }
        }
    
    func search(
        for: String,
        using session: URLSession = .init(configuration: .default, delegate: nil, delegateQueue: .main),
        completionhandler: @escaping(Result<[Jke], DadJokesServiceError>) -> Void
    ){
        
    }
}
