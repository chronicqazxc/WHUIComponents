//
//  TableViewViewModelTest.swift
//  WHUIComponentsTests
//
//  Created by Hsiao, Wayne on 2019/9/20.
//  Copyright © 2019 Wayne Hsiao. All rights reserved.
//

import XCTest
@testable import WHUIComponents

public class MockTableViewViewModel: TableViewViewModelProtocol {
    public private(set) var state = TableViewState()
    public private(set) var data: [TableViewDataModelProtocol]
    public private(set) var callback: CallBack?
    
    required public init(_ callback: @escaping CallBack) {
        self.callback = callback
        self.data = [TableViewDataModelProtocol]()
    }
    
    public func willCallBack(_ type: TableViewState.LoadType) {
        switch type {
        case .more:
            data = [
                TableViewDataModel(title: "BMW", content: "z4", image: UIImage()),
                TableViewDataModel(title: "Mecendes Benz", content: "A1", image: UIImage())
            ]
        case .refresh:
            data = [
                TableViewDataModel(title: "BMW", content: "z4", image: UIImage()),
                TableViewDataModel(title: "Mecendes Benz", content: "A1", image: UIImage()),
                TableViewDataModel(title: "Audi", content: "Q1", image: UIImage())
            ]
        }
        
    }
    
    public func didCallBack(_ type: TableViewState.LoadType) {
        
    }
}

class TableViewViewModelTest: XCTestCase {
    
    var mockTableViewModel: TableViewViewModelProtocol!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel() {
        mockTableViewModel = MockTableViewViewModel { [weak self] in
            guard let strongSelf = self else {
                return
            }
            switch $0 {
            case .refresh:
                XCTAssertEqual(strongSelf.mockTableViewModel.data.count, 3)
            case .more:
                XCTAssertEqual(strongSelf.mockTableViewModel.data.count, 2)
            }
        }
        
        mockTableViewModel.getMore()
        mockTableViewModel.refresh()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}