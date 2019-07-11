//
//  RestarauntModel.swift
//  jo_tum_dena_chaho
//
//  Created by Saurabh Sabharwal on 11/07/19.
//  Copyright © 2019 Saurabh Sabharwal. All rights reserved.
//

import UIKit

struct Restaraunt {
    var name: String?
    var image: String?
    var email: String?
    
    init (name: String, image: String, email: String) {
        self.name = name
        self.image = image
        self.email = email
    }
    
    init () {}
    
    func getUserWithObject(object: [String: Any])-> Restaraunt {
        var restaraunt = Restaraunt()
        
        if let name = object["url"] as? String {
            restaraunt.name = name
        }
        
        if let image = object["thumbnailUrl"] as? String {
            restaraunt.image = image
        }
    
        if let email = object["title"] as? String {
            restaraunt.email = email
        }
        
        return restaraunt
    }
    
}

class Restaraunts: NSObject {
//    var restarauntsArray: [Restaraunt]?

//    init () {}
    override init() {
        super.init()
    }
    
    func getData(completionHandler: @escaping ([Restaraunt]) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/photos/"
        var restaraunts: [Restaraunt] = []
        for i in 1...15 {
            if let url = URL(string: urlString + String(i)) {
                    let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
                        guard let data = data else { return }
                        let jsonData = self.convertToDictionary(data: data)
                        guard let parsedJsonData = jsonData else { return }
                        let restaraunt = Restaraunt()
                        restaraunts.append(restaraunt.getUserWithObject(object: parsedJsonData))
//                    for object in parsedJsonData {
//                        let restaraunt = Restaraunt()
//                        restaraunts.append(restaraunt.getUserWithObject(object: object))
//                    }
                        completionHandler(restaraunts)
                }
                dataTask.resume()
            }
        }
        print(restaraunts.count)
    }
    
    func convertToDictionary(data: Data?) -> [String: Any]? {
        guard let data = data else { return nil }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
