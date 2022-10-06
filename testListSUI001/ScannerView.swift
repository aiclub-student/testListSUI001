//
//  ScannerView.swift
//  testListSUI001
//
//  Created by Amit Gupta on 10/6/22.
//

import SwiftUI
import CodeScanner

struct ScannerView: View {
        @State var isPresentingScanner = false
        @State var scannedCode: String?

        var body: some View {
            NavigationView {
                VStack(spacing: 10) {
                    if self.scannedCode != nil {
                        debugText("Found code "+scannedCode!)
                        //NavigationLink("Next page", destination: NextView(scannedCode: scannedCode!), isActive: .constant(true)).hidden()
                    }
                    Button("Scan Code") {
                        self.isPresentingScanner = true
                    }
                    .sheet(isPresented: $isPresentingScanner) {
                        self.scannerSheet
                    }
                    Text("Scan a QR code to begin")
                }

            }
        }

        var scannerSheet : some View {
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
        }

    func debugText(_ s:String) -> some View {
        print("Debug Text",s)
        return Text(s)
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
