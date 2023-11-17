//
//  EditCountMemoView.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/17.
//

import SwiftUI

struct EditCountMemoView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var isShowCountSettingView = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationStack {
            VStack {
                inputTitleTextField()
                textEditorView()
                
            }
            .sheet(isPresented: $isShowCountSettingView) {
                CountSettingView(viewModel: viewModel, isClose: $isShowCountSettingView)
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowCountSettingView = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                            .foregroundStyle(Color.primary)
                    }
                }
                ToolbarItem(placement: .principal) {
                    CharacterCountResultLabelView()
                }
            }
        }
    }
    
    ///文字数を表示するラベル
    @ViewBuilder
    private func CharacterCountResultLabelView() -> some View {
        Text("\(viewModel.isCountDown ? "残" : "計")：\(viewModel.countCharacters())")
            .foregroundStyle(viewModel.countCharacters() < 0 ? .red : .primary)
            .font(.title)
            .fontWeight(.bold)
    }
    
    ///ユーザーがカウント対象となるテキストを入力するためのテキストエディター
    @ViewBuilder
    private func textEditorView() -> some View {
        TextEditor(text: $viewModel.userInputText)
            .padding(.horizontal, 10.0)
    }
    
    ///メモのタイトルを入力するためのテキストフィールド
    @ViewBuilder
    private func inputTitleTextField() -> some View {
        TextField("タイトル", text: $viewModel.countMemoTitle)
            .font(.title)
            .fontWeight(.bold)
            .padding(.leading, 10.0)
        
        Divider()
    }
}


#Preview {
    EditCountMemoView(viewModel: ViewModel())
}
