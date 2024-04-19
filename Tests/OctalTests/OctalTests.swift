import XCTest
@testable import Octal

final class OctalTests: XCTestCase {
    func testOctalEnDecode() throws {
        //let clearstring = "Helloafiaifaibfiabfibaifbiabfiøでの日本語文字コードを扱うために使用されている従来の"
        let clearstring = "Test-aidu"
        let string = clearstring.data(using: .utf8)!.octalString
        guard let decodedData = string.octalDecodedData else {
            return
        }
        guard let res = String(data: decodedData, encoding: .utf8) else {
            return
        }
        let string1 = clearstring.octalString()
        let res1 = string1?.octalDecodedString()
        
        XCTAssertTrue(res == clearstring && res1 == clearstring)
    }
}
