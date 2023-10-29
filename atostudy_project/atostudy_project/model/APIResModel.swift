//
//  APIResModel.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/29/23.
//

import Foundation

struct characterResponse: Codable {
    var result: Bool
    var message: String
    var error: String?
    var data: [characterData]
}

struct characterData: Codable {
    var characterSeq: Int
    var engName: String
    var korName: String
    var filePath: String
}

struct signUpResponse: Codable {
    var result: Bool
    var message: String
    var error: signUpError?
    var data: signUpData?
}

struct signUpErrorResponse: Codable {
    var result: Bool
    var message: String
    var error: signUpError?
    var data: String?
}


struct signUpData: Codable {
    var snsType: String
    var nickname: String
    var character: CLong
    var characterName: String
    
}

struct signUpError: Codable {
    var code: String
    var viewType: String
    var message: String
}
