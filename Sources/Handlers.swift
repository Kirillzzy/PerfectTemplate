//
//  Handlers.swift
//  SocialMilkServer
//
//  Created by Kirill Averyanov on 08/02/2017.
//
//

import PerfectHTTP


public func makeJSONRoutes(_ root: String = "/api/v1") -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uri: "\(root)/get", handler: getJust)
    
    return routes
}
