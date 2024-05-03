//
//  Emoji.swift
//  UConnect
//
//  Created by student on 03/05/24.
//

import Foundation

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
}

var emojis: [Emoji] = [
    Emoji(symbol: "😃", name: "Grinning Face", description: "A typical smiley face", usage: "Happiness"),
    Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face", usage: "unsure what to think, displeasure"),
    Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
    Emoji(symbol: "🧑🏻‍💻", name: "Developer", description: "A person working on a Macbook(probaby using Xcode to make a cool app)", usage: "apps, software, programming"),
    Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle", usage: "something slow"),
    Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant", usage: "good memory"),
    Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti", usage: "Spaghetti"),
    Emoji(symbol: "🎲", name: "Die", description: "A single die", usage: "Taking a risk chance; game")
]
