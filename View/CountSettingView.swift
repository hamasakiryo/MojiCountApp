//
//  SettingView.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/10/30.
//

import SwiftUI

struct CountSettingView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var isClose: Bool
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Toggle(isOn: $viewModel.isCountDown) {
                        Text("\(viewModel.isCountDown ?  "ダウン" : "アップ")")
                    }
                    .toggleStyle(.button)
                    .buttonStyle(.bordered)
                    
                    if viewModel.isCountDown {
                        inputCharacterLimitTextField()
                    }
                }
                Toggle("空白をカウントする",isOn: $viewModel.isIncludingSpace)
                Toggle("改行をカウントする",isOn: $viewModel.isIncludingNewLines)
                Toggle("//で囲った文字を削除",isOn: $viewModel.isEnclosedTextRemoved)
            }
            .scrollDisabled(true)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isClose = false
                    } label: {
                        Text("OK")
                            .foregroundStyle(Color.primary)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("カウント方式設定")
                        .fontWeight(.bold)
                }
            }
        }
    }
    ///カウントダウン用の制限文字数を入力するテキストフィールドを生成する関数
    @ViewBuilder
    private func inputCharacterLimitTextField() -> some View {
        TextField("カウントダウン制限文字数",text: $viewModel.inputCharacterLimit)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
    }
}

#Preview {
    CountSettingView(viewModel: ViewModel(), isClose: .constant(false))
}
