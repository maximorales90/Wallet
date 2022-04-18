//
//  Card.swift
//  Wallet
//
//  Created by Maximiliano Morales on 18/04/2022.
//

import SwiftUI

//MARK: Card Model

struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}

// MARK: Sample Data

var cards: [Card] = [
    Card(name: "Dibu Martinez", cardNumber: "4929 0958 237 63677", cardImage: "card1"),
    Card(name: "Ángelito Di María", cardNumber: "4179 2863 0168 7150", cardImage: "card2"),
    Card(name: "Diego Maradona", cardNumber: "4716 2394 4688 1010", cardImage: "card3"),
    Card(name: "Lionel Messi", cardNumber: "5295 8066 4295 1010", cardImage: "card4"),
]
