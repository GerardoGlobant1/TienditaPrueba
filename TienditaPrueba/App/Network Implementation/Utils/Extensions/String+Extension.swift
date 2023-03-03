//
//  String+Extension.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 01/03/23.
//

import Foundation

extension String {
    static func makeForEndpoint(_ endpoint: String) -> String {
        var urlString = Constants.baseURL
        urlString += endpoint
        
        return urlString
    }
}
