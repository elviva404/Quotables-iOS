//
//  QTLoadingView.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 28/08/2025.
//

import SwiftUI


public struct QTLoader: View {
    @State private var isAnimating = false
    private let size: CGFloat
    private let color: Color
    private let text: String?
    
    public init(size: CGFloat = 40, color: Color = .blue, text: String? = nil) {
        self.size = size
        self.color = color
        self.text = text
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .stroke(color.opacity(0.2), lineWidth: 4)
                    .frame(width: size, height: size)
                
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(color, lineWidth: 4)
                    .frame(width: size, height: size)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(
                        Animation.linear(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: isAnimating
                    )
            }
            
            if let text = text {
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - Loader View Modifier
public struct LoadingViewModifier: ViewModifier {
    let isLoading: Bool
    let text: String?
    
    public init(isLoading: Bool, text: String? = nil) {
        self.isLoading = isLoading
        self.text = text
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
                .blur(radius: isLoading ? 1 : 0)
            
            if isLoading {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                
                QTLoader(text: text)
                    .frame(width: 60, height: 60)
            }
        }
    }
}

// MARK: - View Extension
public extension View {
    func loading(_ isLoading: Bool, text: String? = nil) -> some View {
        modifier(LoadingViewModifier(isLoading: isLoading, text: text))
    }
}

// MARK: - Loader Manager
public class QTLoaderManager {
    private static var loaderWindow: UIWindow?
    private static var loaderView: UIHostingController<QTLoader>?
    
    public static func show(text: String? = nil) {
        guard loaderWindow == nil else { return }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = .alert
        window.backgroundColor = .clear
        
        let loader = QTLoader(text: text)
        let hostingController = UIHostingController(rootView: loader)
        hostingController.view.backgroundColor = .clear
        
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
        
        loaderWindow = window
        loaderView = hostingController
    }
    
    public static func hide() {
        loaderWindow?.resignKey()
        loaderWindow = nil
        loaderView = nil
    }
}
