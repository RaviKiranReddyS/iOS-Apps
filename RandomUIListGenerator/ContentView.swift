//
//  ContentView.swift
//  RandomUIListGenerator
//
//  Created by Ravi Kiran Reddy on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    
    // The goal of this project is to randomly add data to the list and display in the view on click of the button. At this time, no additional check within the list is done.
    var myData = ["SVR","Padma","RaviKiran","Nishita","Srihitha","Riyansh"]
    
    @State var RandomList = [String]()
    @State var dataCounter = 0
    
    var body: some View {
        
        VStack{
            List(RandomList, id: \.self){ arrayElement in
                        Text(arrayElement)
                    }
            
            Spacer()
            Button("Add Data to List"){
                let randomNumber = Int.random(in: 0...myData.count-1)
                        
                if(dataCounter < myData.count)
                {
                    RandomList.append(myData[randomNumber])
                    dataCounter += 1
                }
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
