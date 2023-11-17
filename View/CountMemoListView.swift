//
//  Home.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/13.
//

import SwiftUI

struct CountMemoListView: View {
    @ObservedObject var viewModel = ViewModel()
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationStack {
            List{
                ForEach(userData.memos) { countMemo in
                    NavigationLink(destination: EditCountMemoView(viewModel: viewModel)) {
                        CountMemoListRow(countMemo: countMemo)                    }
                }
            }
            .navigationTitle("リスト")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: AddNewCountMemoView(viewModel: viewModel)) {
                        Image(systemName: "square.and.pencil.circle")
                            .foregroundStyle(Color.primary)
                            .font(.largeTitle)
                    }
                }
            }
            .foregroundStyle(Color.primary)
        }
    }
}



#Preview {
    CountMemoListView()
        .environmentObject(UserData())
}
