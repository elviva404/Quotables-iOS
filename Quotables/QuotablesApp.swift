//
//  QuotablesApp.swift
//  Shared
//
//  Created by Elikem Savie on 10/04/2021.
//

import SwiftUI
import netfox
import Combine

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
//    var objectWillChange: ObservableObjectPublisher
    
    static let shared = AppContainer()

    var quoteClient: QuoteClientProtocol

    init() {
        quoteClient = QuoteClient()
    }

}
