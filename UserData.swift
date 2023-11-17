//
//  UserData.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/17.
//

import SwiftUI

class UserData: ObservableObject {
   @Published var memos = [
    CountMemo(title: "タイトル", content: "メモの内容", characterCount: "1000", date: "2023\n11/20"),
    CountMemo(title: "タイトル２", content: "メモの内容２", characterCount: "2000", date: "2023\n11/21")
    ]
}

