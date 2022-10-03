//
//  ShowListView.swift
//  Tele
//
//  Created by Chris Hand on 10/2/22.
//

import SwiftUI

struct ShowListItem: View {
    var name: String
    var service: String
    
    var body: some View {
        VStack {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            Text(service)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .border(.blue)
        .padding()
    }
}

struct ShowListItem_Previews: PreviewProvider {
    static var previews: some View {
        ShowListItem(name: "Game of Thrones", service: "HBO")
    }
}
