//
//  QuotablesApp.swift
//  Shared
//
//  Created by Elikem Savie on 10/04/2021.
//

import SwiftUI
import netfox

@main
struct QuotablesApp: App {

    let appContainer = AppContainer.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(appContainer)
                .onAppear {
                    NFX.sharedInstance().start()
                }
        }
    }
}

final class AppContainer: ObservableObject {
    
    static let shared = AppContainer()

    var quoteClient: QuoteClientProtocol

    init() {
        quoteClient = QuoteClient()
    }

}
