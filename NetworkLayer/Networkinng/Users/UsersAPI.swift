//
//  UsersAPI.swift
//  NetworkLayer
//
//  Created by Ahmed masoud on 5/21/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation

protocol UsersAPIProtocol {
    func getUsers(completion: @escaping (Result<BaseResponse<[UserModel]>?, NSError>) -> Void)
    func createUser(name: String, job: String, completion: @escaping (Result<CreateUserResponse?, NSError>) -> Void)

}


class UsersAPI: BaseAPI<UsersNetworking>, UsersAPIProtocol {
    
    
    //MARK:- Requests
    
    func getUsers(completion: @escaping (Result<BaseResponse<[UserModel]>?, NSError>) -> Void) {
        self.fetchData(target: .getUsers, responseClass: BaseResponse<[UserModel]>.self) { (result) in
            completion(result)
        }
    }
    
    func createUser(name: String, job: String, completion: @escaping (Result<CreateUserResponse?, NSError>) -> Void) {
        self.postData(target: .createUser(name: name, job: job), responseClass: CreateUserResponse.self) { (result) in
            completion(result)
        }
    }


}
