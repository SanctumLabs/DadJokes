//
//  EndpointsHelper.swift
//  DadJokesNetworking
//
//  Created by George Nyakundi on 18/02/2022.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "icanhazdadjoke.com"
        components.path = "/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL Components: \(components)"
            )
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
}

extension Endpoint {
    static var random: Self {
        Endpoint(path: "/")
    }
//    static var search: Self {
//        Endpoint(path: "/search", queryItems: <#T##[URLQueryItem]#>)
//    }
}
