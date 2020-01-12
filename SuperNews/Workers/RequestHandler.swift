//
//  RequestHandler.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import Foundation
import Alamofire

let requestHandler = RequestHandler()

class RequestHandler {
    
    var sessionManager: Alamofire.SessionManager;
    
    init() {
        sessionManager = Alamofire.SessionManager.init()
    }
    
    func get(resource: String) -> DataRequest {
        return sessionManager.request(Constants.baseDomain + resource)
    }
}
