//
//  APICaller.swift
//  APIKit
//
//  Created by Nguyen Quang Ha on 11/10/2022.
//

import Foundation

public class APICaller {
    public static let shared = APICaller()
    
    private init() {}
    
    public func fetchCourseNames(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            completion([])
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            
            //Decode
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(result)
            }
            catch {
                completion([])
            }
        }
        task.resume()
    }
}
