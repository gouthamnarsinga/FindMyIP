//
//  ContentView.swift
//  FindMyIP
//
//  Created by Danush on 30/03/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct FindMyIPContentView: View {
    public init() {}
    
    @ObservedObject var viewModel = IPViewModel()
    
    public var body: some View {
        VStack {
            if viewModel.isLoading {
                if #available(iOS 14.0, *) {
                    ProgressView()
                } else {
                    // Fallback on earlier versions
                }
            } else {
                Text("Your IP Address: \(viewModel.ipAddress)")
                    .padding()
                if !viewModel.errorMessage.isEmpty {
                    Text("Error: \(viewModel.errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .onAppear {
            self.viewModel.fetchIPDetails()
        }
    }
}


@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FindMyIPContentView()
    }
}
