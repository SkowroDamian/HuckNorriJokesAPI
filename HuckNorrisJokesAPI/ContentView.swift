//
//  ContentView.swift
//  HuckNorrisJokesAPI
//
//  Created by Damian Skowroński on 17/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.jokes, id: \.self) { joke in
                    Text(joke.value)
                }
            }.listStyle(.plain)
            Button {
                viewModel.fetch()
            } label: {
                Text("Fetch joke")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
