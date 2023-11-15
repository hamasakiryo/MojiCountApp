//
//  CountMemoListRow.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/13.
//

import SwiftUI

struct CountMemoListRow: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.countMemoTitle)
                    .lineLimit(1)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack{
                Text("2023\n11/20")
                Spacer()
                Text(viewModel.userInputText)
                    .lineLimit(2)
                    .foregroundStyle(.gray)
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.orisinal)
                    .frame(width: 70, height: 30)
                    .overlay(Text("\(viewModel.countCharacters())")
                        .foregroundStyle(.primary))
            }
        }
    }
}

#Preview {
    List{
        CountMemoListRow(viewModel: ViewModel())
    }
}
