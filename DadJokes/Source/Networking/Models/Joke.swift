//
//  Joke.swift
//  DadJokesNetworking
//
//  Created by George Nyakundi on 18/02/2022.
//

import Foundation

struct Jke: Codable {
    let id: String
    let joke: String
    let isLoved: Bool?
    let isLiked: Bool?
    let isDisliked: Bool?
}
