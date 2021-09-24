//
//  NetworkService.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import Foundation
import SVProgressHUD

class NetworkService: NSObject {

    func fetchEventList(searchText: String, pageNumber: String, completion : @escaping (EventListModel) -> ()) {

        
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.clear)
        
        var searchURL = URLComponents(string: APIUrl.eventList)!
        let queryItems = [URLQueryItem(name: APIKeys.clientIdKey, value: ClientKeys.clientId), URLQueryItem(name: APIKeys.searchKey, value: searchText), URLQueryItem(name: APIKeys.page, value: pageNumber)]
        searchURL.queryItems = queryItems
        URLSession.shared.dataTask(with: searchURL.url!) { (data, urlResponse, error) in
            SVProgressHUD.dismiss()

            if let data = data {
                
                do{
                    let objResponse =  try JSONDecoder().decode(EventListModel.self, from: data)
                    completion(objResponse)
                }catch let error{
                    print("error is \(error)")
                }
//                let empData = try! jsonDecoder.decode(EventListModel.self, from: data)
//                    completion(empData)
            }
        }.resume()
    }
}


