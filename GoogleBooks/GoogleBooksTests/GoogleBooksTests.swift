//
//  GoogleBooksTests.swift
//  GoogleBooksTests
//
//  Created by Admin on 5/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest
import Alamofire
@testable import GoogleBooks

class GoogleBooksTests: XCTestCase {
    
    func handleVideos() {
        self.exp?.fulfill()
    }
    
    var viewModel: VideoViewModel!
    var exp: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        viewModel = VideoViewModel()
        
        //        @objc func updateVideos(notification: NSNotification) {
        //            print("someting has downloaded")
        //
        //        NotificationCenter.default.addObserver(self, selector:#selector(updateVideos(notification:)), name: NSNotification.Name(rawValue: "test"), object: nil)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitital() {
        XCTAssertTrue(viewModel.myVideos.count == 0)
    }
    
    func testData() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}





