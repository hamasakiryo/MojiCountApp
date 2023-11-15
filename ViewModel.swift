//
//  ViewModel.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/15.
//

import SwiftUI

class ViewModel: ObservableObject {
    //isCountDownがtrueになった場合にCountSetteingViewで設定するカウントダウン文字数
    @Published var inputCharacterLimit = ""
    
    //TextEditorにユーザーが入力するテキスト
    @Published var userInputText = ""
    
    //カウントメモのタイトル
    @Published var countMemoTitle = ""
    
    @Published var isIncludingSpace = false
    @Published var isIncludingNewLines = false
    @Published var isEnclosedTextRemoved = false
    @Published var isCountDown = false
    
    ///条件に応じてuserInputTextを修正し、その文字数を返す関数
    func countCharacters() -> Int {
        var modifiedText = userInputText
        
        // スペース（半角・全角）を削除
        if !isIncludingSpace {
            modifiedText = modifiedText.replacingOccurrences(of: "[ 　]", with: "", options: .regularExpression)
        }
        
        // 改行文字を削除
        if !isIncludingNewLines {
            modifiedText = modifiedText.replacingOccurrences(of: "\n", with: "", options: .regularExpression)
        }
        
        //「//」で囲んだテキストを削除する
        if isEnclosedTextRemoved {
            modifiedText = modifiedText.replacingOccurrences(of: "//(.*?)//", with: "", options: .regularExpression)
        }
        
        //カウントダウン方式を適応する
        if isCountDown {
            return (Int(inputCharacterLimit) ?? 0) - modifiedText.count
        }
        
        return modifiedText.count
    }
}
