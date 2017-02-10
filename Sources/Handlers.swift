//
//  Handlers.swift
//  SocialMilkServer
//
//  Created by Kirill Averyanov on 08/02/2017.
//
//

import PerfectHTTP


public func makeJSONRoutes(_ root: String = "/api/v1") -> Routes {
//    var routes = Routes()
//    
//    routes.add(method: .get, uri: "\(root)/get", handler: getJust)
//    
//    return routes
    var routes = Routes()
    
//    routes.add(method: .get, uris: ["/", "index.html"], handler: indexHandler)
//    routes.add(method: .get, uri: "/foo/*/baz", handler: echoHandler)
//    routes.add(method: .get, uri: "/foo/bar/baz", handler: echoHandler)
//    routes.add(method: .get, uri: "/user/{id}/baz", handler: echo2Handler)
//    routes.add(method: .get, uri: "/user/{id}", handler: echo2Handler)
//    routes.add(method: .post, uri: "/user/{id}/baz", handler: echo3Handler)
    
    // Test this one via command line with curl:
    // curl --data "{\"id\":123}" http://0.0.0.0:8181/raw --header "Content-Type:application/json"
//    routes.add(method: .post, uri: "/raw", handler: rawPOSTHandler)
    
    // Trailing wildcard matches any path
//    routes.add(method: .get, uri: "**", handler: echo4Handler)
    
    // Routes with a base URI
    // Create routes for version 1 API
    var apiGet = Routes()
    apiGet.add(method: .get, uri: "/posts/all", handler: postsAll)
    apiGet.add(method: .get, uri: "/posts/vk", handler: postsVK)
    apiGet.add(method: .get, uri: "/posts/twitter", handler: postsTwitter)
    apiGet.add(method: .get, uri: "/posts/facebook", handler: postsFacebook)

    apiGet.add(method: .get, uri: "/checkedposts/vk", handler: checkedPostsVK)
    apiGet.add(method: .get, uri: "/checkedposts/twitter", handler: checkedPostsTwitter)
    apiGet.add(method: .get, uri: "/checkedposts/facebook", handler: checkedPostsFacebook)
    
    apiGet.add(method: .get, uri: "/apps", handler: getApps)
    
    //
    var apiAuth = Routes()
    apiAuth.add(method: .get, uri: "/vk/{token}", handler: authVK)
    apiAuth.add(method: .get, uri: "/twitter/{token}", handler: authTwitter)
    apiAuth.add(method: .get, uri: "/facebook/{token}", handler: authFacebook)

    
    // API version 1
    var api1Routes = Routes(baseUri: "/get")
    var api2Routes = Routes(baseUri: "/auth")
    // Add the main API calls to version 1
    api1Routes.add(apiGet)
    api2Routes.add(apiAuth)
    // Add both versions to the main server routes
    routes.add(api1Routes)
    routes.add(api2Routes)
    // Check the console to see the logical structure of what was installed.
    print("\(routes.navigator.description)")
    return routes
}

func postsAll(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got All posts</html></body>")
    response.completed()
}

func postsVK(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got VK posts</html></body>")
    response.completed()
}

func postsTwitter(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got Twitter posts</html></body>")
    response.completed()
}

func postsFacebook(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got Facebook posts</html></body>")
    response.completed()
}

func checkedPostsVK(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got VK checked posts</html></body>")
    response.completed()
}

func checkedPostsTwitter(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got Twitter checked posts</html></body>")
    response.completed()
}

func checkedPostsFacebook(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got Facebook checked posts</html></body>")
    response.completed()
}

func getApps(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You got apps list</html></body>")
    response.completed()
}

func authVK(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You authorized to VK with \(request.urlVariables["token"] ?? "error") token</html></body>")
    response.completed()
}

func authTwitter(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You authorized to Twitter with \(request.urlVariables["token"] ?? "error") token</html></body>")
    response.completed()
}

func authFacebook(request: HTTPRequest, _ response: HTTPResponse) {
    response.appendBody(string: "<html><body>You authorized to Facebook with \(request.urlVariables["token"] ?? "error") token</html></body>")
    response.completed()
}


//func echoHandler(request: HTTPRequest, _ response: HTTPResponse) {
//    response.appendBody(string: "Echo handler: You accessed path \(request.path) with variables \(request.urlVariables)")
//    response.completed()
//}
//
//func echo2Handler(request: HTTPRequest, _ response: HTTPResponse) {
//    response.appendBody(string: "<html><body>Echo 2 handler: You GET accessed path \(request.path) with variables \(request.urlVariables)<br>")
//    response.appendBody(string: "<form method=\"POST\" action=\"/user/\(request.urlVariables["id"] ?? "error")/baz\"><button type=\"submit\">POST</button></form></body></html>")
//    response.completed()
//}
//
//func echo3Handler(request: HTTPRequest, _ response: HTTPResponse) {
//    response.appendBody(string: "<html><body>Echo 3 handler: You POSTED to path \(request.path) with variables \(request.urlVariables)</body></html>")
//    response.completed()
//}
//
//func rawPOSTHandler(request: HTTPRequest, _ response: HTTPResponse) {
//    response.appendBody(string: "<html><body>Raw POST handler: You POSTED to path \(request.path) with content-type \(request.header(.contentType)) and POST body \(request.postBodyString)</body></html>")
//    response.completed()
//}
//
