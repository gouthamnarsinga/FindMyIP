//
//  ContentView.swift
//  FindMyIP
//
//  Created by Danush on 30/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = IPViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
