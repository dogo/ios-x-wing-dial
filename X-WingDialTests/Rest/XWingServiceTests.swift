//
//  XWingServiceTests.swift
//  X-WingDialTests
//
//  Created by Diogo Autilio on 02/09/23.
//  Copyright © 2023 Diogo Autilio. All rights reserved.
//

import Nimble
import Quick

@testable import X_WingDial

final class XWingServiceTests: AsyncSpec {

    override class func spec() {

        describe("XWingService") {

            var sut: XWingService!
            var client: HttpClientMock!

            beforeEach {
                client = HttpClientMock()
                sut = XWingService(client: client)
            }

            it("retrieve factions list with success") {
                client.fileName = "factions_ships"

                await expect { try? await sut.fetchFactions() }.toNot(beNil())
            }

            it("retrieve pilots list with success") {
                client.fileName = "tie-advanced-x1"

                await expect { try? await sut.fetchPilots(faction: "galactic-empire", starship: "tie-advanced-x1") }.toNot(beNil())
            }

            it("should cancel all requests") {
                sut.cancelAllRequests()
                expect(client.isCancelled) == true
            }
        }
    }
}
