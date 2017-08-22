@_exported import Vapor

extension Application {
    public func setup() throws {
        try setupRoutes()
        // Do any additional droplet setup
    }
}
