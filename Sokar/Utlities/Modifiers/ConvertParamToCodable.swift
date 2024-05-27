//
//  ConvertParamToCodable.swift
//  Innate
//
//  Created by Taimoor Arif on 28/12/2023.
//

import Foundation

func getParamsFromCodable<T:Codable>(object:T) -> [String : Any]? {

        var param  : [String : Any] = [:]

        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(object){
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)

            if let json = jsonString {
                param = convertJsonToDictionary(text: json) ?? [:]
            }

        }

        return param
    }
    func convertJsonToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
