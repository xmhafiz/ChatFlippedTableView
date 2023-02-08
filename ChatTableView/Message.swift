//
//  Message.swift
//  ChatTableView
//
//  Created by Mohd Hafiz on 02/02/2023.
//

import Foundation

struct Message {
    var text: String
    var time: String
    var senderName: String = ""
    var isSender: Bool = false
}

struct SampleData {
    static let messages: [Message] = [
        Message(text: "Cool. See you there", time: "8.42 am", senderName: "Fred"),
        Message(text: "Yeah, looks great!", time: "8.40 am", senderName: "John Smith", isSender: true),
        Message(text: "Going to play soccer this morning. Bob and Alice will join too. Are you joining?", time: "8.35 am", senderName: "Fred"),
        Message(text: "Any plan today?", time: "8.34 am", senderName: "John Smith", isSender: true),
        Message(text: "Hey man!", time: "8.31 am", senderName: "Fred"),
        Message(text: "Hello, Fred", time: "8.31 am", senderName: "John Smith", isSender: true),
    ]

    static let lorems = """
    Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt
    """
    
    static func getRandomMessage() -> String {
        let words = lorems.components(separatedBy: " ")
        let max = words.count
        let randomRange = Int.random(in: 1..<max)
        let randomText: String = words[0...randomRange].joined(separator: " ")
        return randomText
    }
}
