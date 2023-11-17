//
//  MojiCountAppApp.swift
//  MojiCountApp
//
//  Created by 浜崎良 on 2023/10/30.
//

import SwiftUI

@main
struct MojiCountAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
        }
    }
}
