//
//  HttpCilent.swift
//  FizzBuzz
//
//  Created by simons on 2016. 10. 16..
//  Copyright © 2016년 simons. All rights reserved.
//

import Foundation
import Alamofire

class HttpClient {
    static let sharedInstance = HttpClient()
    
    private var manager : SessionManager?
    
    func getInstance()->SessionManager {
        if let manager = self.manager {
            return manager
        } else {
            var defaultHeaders = SessionManager.defaultHTTPHeaders
            defaultHeaders["X-Naver-Client-Id"] = "AoO5aDFVlQ7eAfKWkWNA"
            defaultHeaders["X-Naver-Client-Secret"] = "s87HwTaG9i"
            
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = defaultHeaders
            configuration.timeoutIntervalForRequest = 40
            configuration.timeoutIntervalForResource = 40
            
            self.manager = Alamofire.SessionManager(configuration: configuration)
            return self.manager!
        }
    }
}
