//
//  DefaultLoginUseCaseTests.swift
//  CalendarTests
//
//  Created by Daniel Cano Arbelaez on 26/02/24.
//

import XCTest
@testable import Calendar

class FakeAuthService: AuthService {
    var loginCalled = false
    
    func login() async throws {
        loginCalled = true
    }
}

class TestingDeaultLoginUseCase: DefaultLoginUseCase {
    var fakeAutService: AuthService!
    
    override func createService() throws -> AuthService {
        return fakeAutService
    }
}

final class DefaultLoginUseCaseTests: XCTestCase {
    var sut: TestingDeaultLoginUseCase!
    
    override func setUp() {
        super.setUp()
        sut = TestingDeaultLoginUseCase()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_GivenNoAuthType_WhenExecuted_ThenItShouldThrowAnError() async {
        do {
            try await sut.execute()
            XCTFail("")
        } catch {}
    }
    
    func test_GivenSomeAuthType_WhenExecuted_ThenItShouldRunService() async {
        let fakeAutService = FakeAuthService()
        sut.fakeAutService = fakeAutService
        sut.set(authType: .google)
        try! await sut.execute()
        
        XCTAssert(fakeAutService.loginCalled)
    }
}
