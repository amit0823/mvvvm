//
//  UserViewModel.swift
//  MVVM_Example
//
//  Created by Alok Deepti on 21/07/19.
//  Copyright © 2019 Alok. All rights reserved.
//

import Foundation

class UserViewModel{
    typealias completionBlock = ([User]) -> ()
    var apiHandler = APIHandler()
    var datasourceArray = [User]()

    
   func getDataFromAPIHandlerClass(url: String, completionBlock : @escaping completionBlock){
    
    apiHandler.getDataFromApi(withUrl: url) { [weak self] (arrUser) in
        self?.datasourceArray = arrUser
        completionBlock(arrUser)
    }
    }
    
    func getNumberOfRowsInSection() -> Int{
        
        return datasourceArray.count
    }
    
    func getUserAtIndex(index : Int) -> User{
        
        let user = datasourceArray[index]
        return user
    }
    
    func getCellData(index : Int) -> String{
        
        let user = self.getUserAtIndex(index: index)
        
        let userId = user.userId ?? 0
        let id = user.id ?? 0
        let body = user.body ?? ""
        let title = user.title ?? ""
        let res = "\(userId)" + " " + "\(id)" + " " + (body) + " " + (title)
        return res
    }
}


