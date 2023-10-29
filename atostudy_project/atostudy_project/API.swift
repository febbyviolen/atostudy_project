//
//  API.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/28/23.
//

import Foundation
import Alamofire

class API {
    static let shared = API()
    
    let getCharacterURL = "https://code.millionz.kr/api/ato/test/character"
    let signUpURL = "https://code.millionz.kr/api/ato/test/regist"
    let token = "{API}"
    
    func getCharacter(completion: @escaping ([characterData]) -> Void) {
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        AF.request(getCharacterURL, method: .get ,encoding: JSONEncoding.default, headers: header).responseDecodable(of: characterResponse.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let characterResponse):
                let response = characterResponse.data
                completion(response)
            case .failure(let error):
                print("Character request failed with error: \(error)")
            }
        }
    }
    
    func signUp(snsType: String, nickName: String, character: CLong, completion: @escaping (signUpResponse) -> Void) {
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let body: [String: Any] = [
            "snsType" : snsType,
            "nickName" : nickName,
            "character": character
        ]
        
        AF.request(signUpURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseDecodable(of: signUpResponse.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let signUpResponse):
                let response = signUpResponse
                completion(response)
            case .failure(let error):
                //test
                let test = signUpResponse(result: true, message: "사용할 수 없는 닉네임입니다", error: signUpError(code: "E999", viewType: "NONE", message: "사용할 수 없는 닉네임입니다"))
                completion(test)
                print("Character request failed with error: \(error)")
            }
        }
    }
}


