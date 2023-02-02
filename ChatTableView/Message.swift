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
    var senderName: String
    var isSender: Bool = false
}

struct SampleData {
    static let messages: [Message] = [
        Message(text: "Sure, let meet there!", time: "8.44 am", senderName: "Ryan"),
        Message(text: "He want to join us", time: "8.43 am", senderName: "John Smith", isSender: true),
        Message(text: "Can I bring my brother with me?", time: "8.43 am", senderName: "John Smith", isSender: true),
        Message(text: "Cool. See you there", time: "8.42 am", senderName: "Ryan"),
        Message(text: "Yeah, looks great!", time: "8.40 am", senderName: "John Smith", isSender: true),
        Message(text: "Going to play soccer this morning. Bob and Alice will join too. Are you joining?", time: "8.35 am", senderName: "Ryan"),
        Message(text: "Any plan today?", time: "8.34 am", senderName: "John Smith", isSender: true),
        Message(text: "Hey man!", time: "8.31 am", senderName: "Ryan"),
        Message(text: "Hello", time: "8.31 am", senderName: "John Smith", isSender: true),
    ]
}
