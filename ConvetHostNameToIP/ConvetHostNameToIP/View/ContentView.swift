//
//  ContentView.swift
//  ConvetHostNameToIP
//
//  Created by Angelos Staboulis on 25/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var viewmodel = ConvertHostNameIPViewModel()
    @State var viewArray:[HostnameToIP]=[]
    @State var hostname:String
    var body: some View {
        HStack{
            Text("Convert HostName to IP")
        }
        HStack{
            TextField("Enter Hostname",text: $hostname).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width:300, height: 90, alignment: .center).autocapitalization(.none)
            Button(action: {
                convertHostName(hostname:hostname)
            }, label: {
                Text("Convert to IP").foregroundColor(.white)
            }).background(Rectangle()).foregroundColor(.blue).frame(width:100, height: 90, alignment: .center)
        }
            List(viewArray){item in
                VStack{
                    Text("ip="+item.ip).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("city="+item.city).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("country="+item.country).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("country_code="+item.countryCode).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("lat="+String(item.lat)).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("lon="+String(item.lon)).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("org="+item.org).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("as="+item.asVar).frame(width: 300, height: 90, alignment: .topLeading)
                    Text("isp="+item.isp).frame(width: 300, height: 90, alignment: .topLeading)
                    
                }
                
            }
    }
    func convertHostName(hostname:String){
        viewmodel.fetchIPHostname(hostname: hostname) { (array) in
            if viewArray.count == 0 {
                viewArray.append(contentsOf: array)
            }
            else{
                viewArray.removeAll()
                viewArray.insert(array[array.count-1], at: 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(hostname: "")
    }
}
