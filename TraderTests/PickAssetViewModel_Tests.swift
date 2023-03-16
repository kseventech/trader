//
//  PickAssetViewModel_Tests.swift
//  TraderTests
//
//  Created by nikolamilic on 3/16/23.
//

import XCTest
@testable import Trader

@MainActor final class PickAssetViewModel_Tests: XCTestCase {

    var vm: PickAssetViewModelImpl!
    
    override func setUpWithError() throws {
        vm = PickAssetViewModelImpl(service: CoinsServiceDummyImpl())
    }

    override func tearDownWithError() throws {
        vm = nil
    }
    
    func test_PickAssetViewModel_coins_shouldBeEmpty() {
        XCTAssertTrue(vm.coins.isEmpty)
    }
    
    func test_PickAssetViewModel_selectedCoin_shouldBeNil() {
        XCTAssertNil(vm.selectedCoin)
    }
    
    func test_PickAssetViewModel_coins_shouldNotBeEmptyAfterGetCoinsCall() async {
        await vm.getCoins()
        XCTAssertTrue(!vm.coins.isEmpty)
    }
    
    func test_PickAssetViewModel_selectedCoin_shouldNotBeNilAfterSelection() async {
        await vm.getCoins()
        vm.selectCoin(coin: vm.coins.first!)
        XCTAssertNotNil(vm.selectedCoin)
    }
}
