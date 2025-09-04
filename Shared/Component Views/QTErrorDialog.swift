//
//  QTErrorDialog.swift
//  Quotables (iOS)
//
//  Created by Elikem Savie on 03/09/2025.
//

import SwiftUI

// MARK: - Error Dialog Component
struct QTErrorDialog: View {
    let error: ErrorResponse
    let onDismiss: () -> Void
    
    private var errorMessage: String {
        return error.combinedErrorMessage
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Error Icon
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.red)
            
            // Error Title
            Text("Error")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            // Error Message
            Text(errorMessage)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Dismiss Button
            Button("OK") {
                onDismiss()
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(12)
        }
        .padding(24)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding(.horizontal, 40)
    }
}

// MARK: - Error Dialog View Modifier
struct ErrorDialogModifier: ViewModifier {
    @Binding var errorResponse: ErrorResponse?
    let onDismiss: (() -> Void)?
    
    init(errorResponse: Binding<ErrorResponse?>, onDismiss: (() -> Void)? = nil) {
        self._errorResponse = errorResponse
        self.onDismiss = onDismiss
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if let error = errorResponse {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        dismissError()
                    }
                
                QTErrorDialog(error: error) {
                    dismissError()
                }
                .transition(.scale.combined(with: .opacity))
                .animation(.easeInOut(duration: 0.3), value: errorResponse?.message ?? "")
            }
        }
    }
    
    private func dismissError() {
        withAnimation(.easeInOut(duration: 0.3)) {
            errorResponse = nil
        }
        onDismiss?()
    }
}

// MARK: - View Extension
extension View {
    /// Shows an error dialog when an ErrorResponse is present
    /// - Parameters:
    ///   - errorResponse: Binding to the ErrorResponse to display
    ///   - onDismiss: Optional callback when the dialog is dismissed
    func errorDialog(
        _ errorResponse: Binding<ErrorResponse?>,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        modifier(ErrorDialogModifier(errorResponse: errorResponse, onDismiss: onDismiss))
    }
}

// MARK: - Error Dialog Manager (Alternative approach)
public class QTErrorDialogManager {
    private static var errorWindow: UIWindow?
    private static var errorViewController: UIHostingController<QTErrorDialog>?
    
    public static func show(error: ErrorResponse, onDismiss: @escaping () -> Void = {}) {
        guard errorWindow == nil else { return }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = .alert
        window.backgroundColor = .clear
        
        let errorDialog = QTErrorDialog(error: error) {
            hide()
            onDismiss()
        }
        let hostingController = UIHostingController(rootView: errorDialog)
        hostingController.view.backgroundColor = .clear
        
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
        
        errorWindow = window
        errorViewController = hostingController
    }
    
    public static func hide() {
        errorWindow?.resignKey()
        errorWindow = nil
        errorViewController = nil
    }
}

// MARK: - Preview
struct QTErrorDialog_Previews: PreviewProvider {
    static var previews: some View {
        let sampleError = ErrorResponse()
        sampleError.message = "Sample error message"
        sampleError.errors  = ["id": ["Wrond i was"]]
        
        return QTErrorDialog(error: sampleError) {
            print("Dismissed")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
