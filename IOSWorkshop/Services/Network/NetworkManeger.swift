//
//  NetworkManeger.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
import Alamofire
class NetworkManeger : NetworkManegerProtocol {
    
    
    static var sharedInstance = NetworkManeger()
    static let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "9782c795femsh5d409dae6ae0657p1df48ajsn810584d982f3",
        "X-RapidAPI-Host": "tasty.p.rapidapi.com"
    ]

    
    private init(){
        
    }
    
    static func getInstance() -> NetworkManeger{
        return sharedInstance
    }
    
    
    func getMeals(with tag: String, completion: @escaping (Result<MealModel?, Error>) -> Void) {
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "9782c795femsh5d409dae6ae0657p1df48ajsn810584d982f3",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        let parameters: Parameters = [
            "from": 0,
            "size": 20,
            "tags": tag
        ]
        
        
        AF.request("https://tasty.p.rapidapi.com/recipes/list", method: .get, parameters: parameters, headers: headers)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(MealModel.self, from: data)
                        completion(.success(jsonData))
                    }catch{
                        completion(.failure(error))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func getSimilarRecipes(with mealID: Int , completion: @escaping (Result<MealModel?, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "9782c795femsh5d409dae6ae0657p1df48ajsn810584d982f3",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        AF.request("https://tasty.p.rapidapi.com/recipes/list-similarities", method: .get, parameters: ["recipe_id": mealID], headers: headers)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(MealModel.self, from: data)
                        completion(.success(jsonData))
                    }catch{
                        completion(.failure(error))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    
    
    
    
    
    
    
    
    
    
    
    
}
