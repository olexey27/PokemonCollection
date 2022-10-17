//
//  ContentView.swift
//  PokemonCollection
//
//  Created by Alexej K on 17.10.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColums = [
        GridItem(.adaptive(minimum: 150))
        ]
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColums, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Collection")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
