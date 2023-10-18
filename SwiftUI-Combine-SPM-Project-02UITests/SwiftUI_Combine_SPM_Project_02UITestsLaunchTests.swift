//
//  SwiftUI_Combine_SPM_Project_02UITestsLaunchTests.swift
//  SwiftUI-Combine-SPM-Project-02UITests
//
//  Created by Eduardo Mausa on 18/10/23.
//

import XCTest

final class SwiftUI_Combine_SPM_Project_02UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
