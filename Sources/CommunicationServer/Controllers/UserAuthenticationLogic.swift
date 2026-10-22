//
//  File.swift
//  CommunicationServer
//
//  Created by Arun Patwardhan on 21/10/26.
//

import Vapor

struct User : Authenticatable {
    var name : String
}

struct UserAuthenticator : AsyncBasicAuthenticator {
    func authenticate(basic : BasicAuthorization, for request : Request) async throws {
        if basic.username == "test" && basic.password == "secret" {
            request.auth.login(User(name: "Test"))
        }
    }
}


