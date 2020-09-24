//
//  APIHandler.swift
//  MVVM_Example
//
//  Created by Alok Deepti on 21/07/19.
//  Copyright © 2019 Alok. All rights reserved.
//

import Foundation

class APIHandler{
    
    typealias completionBlock = ([User]) -> ()
    
    func getDataFromApi(withUrl strUrl : String, completionBlock : @escaping completionBlock){
        
        if let unwrappedUrl = URL(string: strUrl){
            
            URLSession.shared.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) in
                
                if data != nil{
                    let jsonDecoder = JSONDecoder()
                    let userArray = try? jsonDecoder.decode([User].self, from: data!)
                    
                    if userArray != nil{
                        completionBlock(userArray!)

                    }else{
                        let aArray = [User]()
                        completionBlock(aArray)
                    }
                }else{
                    let aArray = [User]()
                    completionBlock(aArray)
                }
                
            }).resume()
        }
    }
        
}
