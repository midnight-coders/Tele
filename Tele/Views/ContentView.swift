//
//  ContentView.swift
//  Tele
//
//  Created by Chris Hand on 10/2/22.
//

import SwiftUI

struct ContentView: View {
    @State private var shows = [
        Show(id: UUID(), name: "She-Hulk", service: "Disney+"),
        Show(id: UUID(), name: "Game of Thrones", service: "HBO"),
        Show(id: UUID(), name: "Picard", service: "Paramount+")]
    
    @State private var isPresented = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(shows, id: \.id) { show in
                    ShowListItem(name: show.name, service: show.service)
                        .padding(-20)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Shows to Watch")
            .navigationBarItems(trailing: Button("add") {
                isPresented = true
            })
        }
        .sheet(isPresented: $isPresented, content: { AddShowScreen() })
    }
    
    func move(from source: IndexSet, to destination: Int) {
        shows.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        shows.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
