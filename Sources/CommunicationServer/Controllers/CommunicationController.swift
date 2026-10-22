//
//  File.swift
//  CommunicationServer
//
//  Created by Arun Patwardhan on 21/10/26.
//

import Vapor
 
struct CommunicationController : RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let protectedRoutesGroup = routes.grouped(UserAuthenticator())
                 
                protectedRoutesGroup.get("Receive", use: getMessage)
                protectedRoutesGroup.post("Send", use: postMessage)
    }
     
    func getMessage(req : Request) throws -> String {
        _ = try req.auth.require(User.self).name
        return "This is a message received from the server."
    }
     
    func postMessage(req : Request) throws -> HTTPStatus {
        _ = try req.auth.require(User.self).name
        let value   : String    = try req.content.decode(String.self)
        print(#line, value)
        return HTTPStatus.ok
    }
}
