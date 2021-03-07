import XCTest
@testable import Faker

class FakerTests: XCTestCase {
    
    override func setUpWithError() throws {
        _ = Faker.context
    }
    
    override func tearDownWithError() throws {
        Faker.context = nil
    }
    
    func testExample() throws {
        let address: [FakerFunction]    = Faker.Address.allCases
        let commerce: [FakerFunction]   = Faker.Commerce.allCases
        let company: [FakerFunction]    = Faker.Company.allCases
        let database: [FakerFunction]   = Faker.Database.allCases
        let date: [FakerFunction]       = Faker.Date.allCases
        let finance: [FakerFunction]    = Faker.Finance.allCases
        let hacker: [FakerFunction]     = Faker.Hacker.allCases
        let image: [FakerFunction]      = Faker.Image.allCases
        let internet: [FakerFunction]   = Faker.Internet.allCases
        let lorem: [FakerFunction]      = Faker.Lorem.allCases
        let name: [FakerFunction]       = Faker.Name.allCases
        let ohone: [FakerFunction]      = Faker.Phone.allCases
        let random: [FakerFunction]     = Faker.Random.allCases
        let system: [FakerFunction]     = Faker.System.allCases
        
        
        let fakers: [FakerFunction] = address + commerce + company + database + date + finance
            + hacker + image + internet + lorem + name + ohone + random + system
        
        fakers.forEach(printFaker)
    }
    
    private func printFaker(_ fakerFunc: FakerFunction) {
        let value1 = fakerFunc.value
        let value2 = fakerFunc.value
        
        print(fakerFunc.name.padding(toLength: 30, withPad: " ", startingAt: 0), value1, value2)
        
        XCTAssertNotNil(value1)
        XCTAssertNotNil(value2)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
