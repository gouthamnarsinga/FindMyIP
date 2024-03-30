//
//  IPViewModel.swift
//  FindMyIP
//
//  Created by Danush on 30/03/24.
//

import Foundation
import Alamofire
import Combine

class IPViewModel: ObservableObject {
    @Published var ipAddress: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    private let apiUrl = "https://ipapi.co/json/"

    private var cancellables = Set<AnyCancellable>()

    func fetchIPDetails() {
        isLoading = true
        AF.request(apiUrl)
            .validate()
            .publishDecodable(type: IPAddressResponse.self)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { response in
                do {
                    self.ipAddress = try response.result.get().ip!
                } catch {
                    self.errorMessage = "Invalid IP Address"
                }
            })
            .store(in: &cancellables)
    }
}
