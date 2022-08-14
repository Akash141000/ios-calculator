//
//  CalcButton.swift
//  calculator (iOS)
//
//  Created by Akash Sanjay Padwal on 05/08/22.
//


import SwiftUI


enum BUTTON_TYPE{
    case number,operation,ac,finalResult
}

struct CalcButton: View {
    var calc = Calculate.sharedInstance;
    var n:String
    var type:BUTTON_TYPE
    var body: some View {
        Button(action:{
            print("clicked",n,type);
            self.calc.setInput(input: n,btnType: type)
        }) {
            ZStack{
                Rectangle().foregroundColor( type == BUTTON_TYPE.number ?  .black : .orange)
                Text(n).font(Font.largeTitle).foregroundColor( type == BUTTON_TYPE.number ? .teal : .black)
            }.frame(alignment:.center)
        }
    }
}


struct calcButton_Previews: PreviewProvider {
    static var previews: some View {
        CalcButton(n:"1",type: BUTTON_TYPE.number)
    }
}
