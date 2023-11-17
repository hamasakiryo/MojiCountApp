//
//  CountMemoListRow.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/13.
//

import SwiftUI

struct CountMemoListRow: View {
    @State var MemoTitle: String
    @State var content: String
    @State var characterCount: String
    @State var date: String
    
    init(countMemo: CountMemo) {
        self.MemoTitle = countMemo.title
        self.content = countMemo.content
        self.characterCount = countMemo.characterCount
        self.date = countMemo.date
    }
    var body: some View {
        VStack{
            HStack{
                Text(MemoTitle)
                    .lineLimit(1)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack{
                Text(date)
                Spacer()
                Text(content)
                    .lineLimit(2)
                    .foregroundStyle(.gray)
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.orisinal)
                    .frame(width: 70, height: 30)
                    .overlay(Text(characterCount)
                        .foregroundStyle(.primary))
            }
        }
    }
}

#Preview {
    List{
        CountMemoListRow(countMemo: CountMemo(title: "Sample Title", content: "Sample Content", characterCount: "100", date: "2023/11/17"))
    }
}
