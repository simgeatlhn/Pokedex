//
//  ContentView.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State var splashScreen  = true
    
    var body: some View {
        ZStack{
            Group{
                if splashScreen {
                    SplashScreen()
                }
                else{
                    PokedexView()
                }
            }
            .onAppear {
                DispatchQueue
                    .main
                    .asyncAfter(deadline:
                            .now() + 3) {
                                self.splashScreen = false
                            }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color(red: 243/255, green: 239/255, blue: 224/255).edgesIgnoringSafeArea(.all)
            LottieView(filename: "pokemon")
                .offset(x: -10, y: 0)
        }
    }
}
