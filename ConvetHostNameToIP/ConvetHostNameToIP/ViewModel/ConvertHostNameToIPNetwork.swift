//
//  ConvertHostNameToIPNetwork.swift
//  ConvetHostNameToIP
//
//  Created by Angelos Staboulis on 25/7/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class ConvertHostNameToIPNetwork{
    var array:[HostnameToIP]=[]
    static let shared = ConvertHostNameToIPNetwork()
    private init(){}
    func fetchIPNetwork(hostname:String,completion:@escaping ([HostnameToIP])->()){
        let url = URL(string: "http://ip-api.com/json/"+hostname)
        let request = URLRequest(url: url!)
        AF.request(request).responseJSON { (dataResponse) in
            let json = JSON(dataResponse.value)
            let model = HostnameToIP(id: UUID().uuidString, ip: json["query"].stringValue, city: json["city"].stringValue,country: json["country"].stringValue, countryCode: json["countryCode"].stringValue, lat: json["lat"].doubleValue, lon: json["lon"].doubleValue, timezone: json["timezone"].stringValue, isp: json["isp"].stringValue,org: json["org"].stringValue, asVar: json["as"].stringValue, asname: json["asname"].stringValue)
            self.array.append(model)
            completion(self.array)
        }
    }
}
