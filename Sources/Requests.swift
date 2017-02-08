//
//  Requests.swift
//  SocialMilkServer
//
//  Created by Kirill Averyanov on 09/02/2017.
//
//

import Foundation
import PerfectHTTP
import PerfectHTTPServer

struct Filter404: HTTPResponseFilter {
    func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        callback(.continue)
    }
    
    func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        if case .notFound = response.status {
            response.bodyBytes.removeAll()
            response.setBody(string: "The file \(response.request.path) was not found. Sorry")
            response.setHeader(.contentLength, value: "\(response.bodyBytes.count)")
            callback(.done)
        } else {
            callback(.continue)
        }
    }
}
