//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ezequiel Parada Beltran on 17/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import SwiftUI


// Custom Modifier


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}



struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int,Int) ->Content
    
    var body: some View {
        
        
        
        VStack{
            Text("Matrix")
            .titleStyle()
            ForEach(0 ..< rows) { row in
                HStack{
                    ForEach(0 ..< self.columns) { column in
                        self.content(row,column)
                        
                    }
                }
            }
        }
    }
}



struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col  in
            HStack{
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
