import Foundation
import Cheetah
import HTTP
import Vapor
import Routing

extension Application {
    func setupRoutes() throws {
        let router = try self.make(SyncRouter.self)
        
        router.on(.get, to: "json") { request in
            var json = JSONObject()
            
            for (element, number) in JSONCreator().generateJSON() {
                json[element] = number
            }
            
            return Response(body: Body(Data(json.serialize())))
        }
        
        router.on(.get, to: "blog") { req in
            let header = CommonHandler().getHeader()
            let footer = CommonHandler().getFooter()
            let body = BlogPageHandler().loadPageContent()
            let blogPage = header + body + footer
            
            return try Response(status: .ok, body: blogPage)
        }
        
        router.on(.get) { req in
            let header = CommonHandler().getHeader()
            let footer = CommonHandler().getFooter()
            let body = IndexHandler().loadPageContent()
            let indexPage = header + body + footer
            
            return try Response(status: .ok, body: indexPage)
        }
    }
}
