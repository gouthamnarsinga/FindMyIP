//
//  MainAppTests.swift
//  MainAppTests
//
//  Created by Danush on 30/03/24.
//

import XCTest
@testable import MainApp
@testable import FindMyIPLibrary

final class MainAppTests: XCTestCase {
    
    var viewModel: IPViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = IPViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testFetchIPDetailsSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "IP address fetched successfully")
        
        // When
        viewModel.fetchIPDetails()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(self.viewModel.ipAddress.isEmpty)
            XCTAssertTrue(self.viewModel.errorMessage.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchIPDetailsFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Failed to fetch IP address")
        
        // When
        viewModel.fetchIPDetails()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.viewModel.ipAddress.isEmpty)
            XCTAssertFalse(self.viewModel.errorMessage.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }

}
