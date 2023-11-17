//
//  CountMemo.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/17.
//

import SwiftUI

struct CountMemo: Identifiable {
   let id = UUID()
    var title: String
    var content: String
    var characterCount: String
    var date: String
    
    init(title: String, content: String, characterCount: String, date: String) {
        self.title = title
        self.content = content
        self.characterCount = characterCount
        self.date = date
    }
}

