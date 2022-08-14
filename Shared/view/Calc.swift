//
//  Calc.swift
//  calculator (iOS)
//
//  Created by Akash Sanjay Padwal on 05/08/22.
//

import Foundation

import SwiftUI

@main
struct Calc: App {
   
    var body: some Scene{
        WindowGroup{
            DisplayView()
        }
    }
}

struct DisplayView: View{
    @ObservedObject var calculate:Calculate = Calculate.sharedInstance
    
    
    var body: some View{
        VStack {
            Text(self.calculate.valToDisplay).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/10, alignment:.trailing).font(.largeTitle)
            ContentMain()
        }.padding(2)
    }
}

struct ContentMain: View {
    let buttons = [[("1",BUTTON_TYPE.number),("2",BUTTON_TYPE.number),("3",BUTTON_TYPE.number),("+",BUTTON_TYPE.operation)],[("4",BUTTON_TYPE.number),("5",BUTTON_TYPE.number),("6",BUTTON_TYPE.number),("-",BUTTON_TYPE.operation)],[("7",BUTTON_TYPE.number),("8",BUTTON_TYPE.number),("9",BUTTON_TYPE.number),("*",BUTTON_TYPE.operation)],[("0",BUTTON_TYPE.number),(".",BUTTON_TYPE.operation),("=",BUTTON_TYPE.finalResult),("AC",BUTTON_TYPE.ac)]]
    var body: some View{
        VStack(spacing:1) {
            ForEach(buttons,id:\.self[0].0) { btnList in ZStack{
                HStack(spacing:2) {
                    ForEach(btnList,id: \.self.0){ buttonInfo in HStack{
                        CalcButton(n:buttonInfo.0,type: buttonInfo.1);
                    }
                    }
                }
            }
            }
        }
    }
    
}

struct calc_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}


