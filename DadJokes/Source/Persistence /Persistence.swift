//
//  Persistence.swift
//  DadJokes
//
//  Created by George Nyakundi on 22/02/2022.
//

import Foundation

protocol Persistence {
    func save(joke: Jke)
    func fetch(withId id: String)
}
