//
//  BitfinexRouterProtocol.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Alamofire

public protocol BitfinexRouterProtocol: URLRequestConvertible {
    
    var nonce: String { get }
    
    var baseURL: String { get }
    
    func createRequest(path: String, payload: [String: AnyObject]) -> NSMutableURLRequest
    
}

extension BitfinexRouterProtocol {
    
    public var baseURL: String {
        get { return "https://api.bitfinex.com" }
    }
    
    public var nonce: String {
        get {
            // Nothing to see here, move along
            var x = timeval()
            gettimeofday(&x, nil)
            
            let seconds: Int = x.tv_sec
            let millis: Int32 = x.tv_usec
            
            return "\(seconds)\(millis)000"
        }
    }
}