import Foundation

let session = URLSession(configuration: .default)

var urlComponents = URLComponents(string: "https://api.plkey.app/theme/review?")!
urlComponents.queryItems?.append(URLQueryItem(name: "themeId", value: "6"))
urlComponents.queryItems?.append(URLQueryItem(name: "start", value: "0"))
urlComponents.queryItems?.append(URLQueryItem(name: "count", value: "20"))

 session.dataTask(with: urlComponents.url!) { data, _, error in
    guard let data = data, error == nil else {
        return
    }

    print(data)
 }
 .resume()

var urlPost = URLComponents(string: "https://api.plkey.app/tmp/theme/PLKEY0-L-81/review")!
var json: [String: String] = ["content": "some content"]

let jsonData = try? JSONSerialization.data(withJSONObject: json)

var request = URLRequest(url: urlPost.url!)
request.httpMethod = "POST"
request.httpBody = jsonData

session.dataTask(with: request) { data, response, error in
    guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
        return
    }
    
    print(response.statusCode)

}.resume()

sleep(10)
