//
//  Home.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/11/13.
//

import SwiftUI

struct CountMemoListView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            List{
                NavigationLink (destination: CountMemoView(viewModel: viewModel)) {
                    CountMemoListRow(viewModel: viewModel)
                        .padding()
                }
            }
            .navigationTitle("リスト")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: CountMemoView(viewModel: viewModel)) {
                        Image(systemName: "square.and.pencil.circle")
                            .foregroundStyle(Color.primary)
                            .font(.largeTitle)
                    }
                }
            }
        }
        .foregroundStyle(Color.primary)
        
    }
}



#Preview {
    CountMemoListView()
}
