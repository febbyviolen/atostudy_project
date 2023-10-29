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
    let token = "token"
    
    func getCharacter(completion: @escaping ([characterData]) -> Void) {
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        AF.request(getCharacterURL, method: .get ,encoding: JSONEncoding.default, headers: header).responseDecodable(of: characterResponse.self) { response in
            switch response.result {
            case .success(let characterResponse):
                let response = characterResponse.data
                completion(response)
            case .failure(let error):
                print("Character request failed with error: \(error)")
            }
        }
    }
    
    func signUp(snsType: String, nickName: String, character: CLong, completion: @escaping (signUpResponse?) -> Void) {
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let body: [String: Any] = [
            "snsType" : snsType,
            "nickname" : nickName,
            "character": character
        ]
        
        AF.request(signUpURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseDecodable(of: signUpResponse.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let signUpResponse):
                completion(signUpResponse)
            case .failure(let error):
                if let data = response.data {
                    if let signUpResponseE = try? JSONDecoder().decode(signUpErrorResponse.self, from: data) {
                        let errRes = signUpResponse(result: signUpResponseE.result, message: signUpResponseE.message, error: signUpResponseE.error)
                        completion(errRes)
                    } else {
                        print("Character request failed with error: \(error)")
                        completion(nil)
                    }
                } else {
                    print("Character request failed with error: \(error)")
                    completion(nil)
                }
            }
        }

    }
}


