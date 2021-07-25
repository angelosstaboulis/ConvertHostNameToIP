//
//  ConvertHostNameIPViewModel.swift
//  ConvetHostNameToIP
//
//  Created by Angelos Staboulis on 25/7/21.
//

import Foundation
class ConvertHostNameIPViewModel{
    var apishared:ConvertHostNameToIPNetwork
    init(){
        apishared = ConvertHostNameToIPNetwork.shared
    }
    func fetchIPHostname(hostname:String,completion:@escaping ([HostnameToIP])->()){
        apishared.fetchIPNetwork(hostname: hostname) { (array) in
            completion(array)
        }
    }
}
