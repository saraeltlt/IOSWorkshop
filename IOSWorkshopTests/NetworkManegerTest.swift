//
//  NetworkManegerTest.swift
//  IOSWorkshopTests
//
//  Created by Eslam gamal on 27/05/2023.
//

import XCTest
@testable import IOSWorkshop

final class NetworkManegerTest: XCTestCase {
    var networkManger=NetworkManeger.sharedInstance
    
    func testgetMeals(){
        let myExpectation = expectation(description: "wait for my API response")
        networkManger.getMeals(with: "breakfast"){ mealResponse in
            switch mealResponse {
            case .success(let data):
                if let mealResponse = data {
                    XCTAssertGreaterThan(mealResponse.results!.count, 0,"Error in retrive array")
                    myExpectation.fulfill()
                } else {
                    XCTFail()
                    myExpectation.fulfill()
                }
                
            case .failure(let error):
                XCTFail()
                myExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10,handler: nil)
    }
    
    func testgetSimilarRecipes(){
        let myExpectation = expectation(description: "wait for my API response")
        networkManger.getSimilarRecipes(with: 90)  {mealResponse in
            switch mealResponse {
            case .success(let data):
                if let mealResponse = data {
                    XCTAssertGreaterThan(mealResponse.results!.count, 0,"Error in retrive array")
                    myExpectation.fulfill()
                } else {
                    XCTFail()
                    myExpectation.fulfill()
                }
                
            case .failure(let error):
                XCTFail()
                myExpectation.fulfill()
            }
           
        }
        waitForExpectations(timeout: 10,handler: nil)
    }
}
    
    
    
    

