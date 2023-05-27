import XCTest
@testable import IOSWorkshop // Import your app's module

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGetMeals() {
        // Given
        let expectation = XCTestExpectation(description: "Get meals")
        
        // When
        viewModel.getMeals(mealCategory: "popular")
        
        // Then
        DispatchQueue.main.async {
            XCTAssertTrue((self.viewModel.mealsData.value != nil), "Meals data should be true")
            XCTAssertGreaterThan(self.viewModel.getMealsNumbers(), 0, "Number of meals should be greater than 0")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAddToFavorite() {
        // Given
        let mealToInsert = Meal(/* create a mock Meal object for testing */)
        
        // When
        viewModel.addToFavorite(mealToInsert: mealToInsert)
        
        // Then
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.addToFavorite.value, .success, "Adding to favorites should be successful")
        }
    }
    
    // Add more unit tests for other methods if needed
    
    // Example test for getData() method
    func testGetData() {
        // Given
        viewModel.mealResponse = [Meal(/* create mock Meal objects for testing */)]
        let index = 0
        
        // When
        let data = viewModel.getData(index: index)
        
        // Then
        XCTAssertEqual(data.name, viewModel.mealResponse[index].name, "Returned data should match the meal at the given index")
    }
    
    // Example test for navigateToDetails() method
  
}

