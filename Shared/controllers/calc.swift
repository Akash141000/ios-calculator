//
//  calc.swift
//  calculator (iOS)
//
//  Created by Akash Sanjay Padwal on 05/08/22.
//

import Foundation
import SwiftUI


class Calculate: ObservableObject {
    var operationToPerform: String?{
        willSet{
            if(oldValue.count == 0){
                self.oldValue = self.currentInputValue;
                self.currentInputValue = ""
                return;
            }
            self.oldValue = String(self.calc(oldVal: Double( self.oldValue)!,newVal: Double( self.currentInputValue)!))
            self.currentInputValue = ""
        }
    };
    @Published var valToDisplay:String = "" ;
    static public let sharedInstance = Calculate();
    var oldValue: String = "";
    var currentInputValue : String = "";
    
    init(){
        self.currentInputValue = ""
    }
    
    func calc(oldVal:Double,newVal:Double)->Double{
        print("old",oldVal,"new",newVal)
        switch operationToPerform {
        case "+" :
            print("+")
            return oldVal + newVal;
        case "-" :
            print("-")
            return oldVal - newVal;
        case "*" :
            print("*")
            return oldVal *  newVal;
        default:
            return oldVal;
        }
    }
    
   
    func accumulateValue(valueToAccumulate:String){
        self.valToDisplay = self.valToDisplay + valueToAccumulate;
        self.dispatchVal()
    }
    
    func dispatchVal(){
        DispatchQueue.main.async {
            Calculate.sharedInstance.valToDisplay = self.valToDisplay;
        }
    }
    
    func resetAllValues(){
        self.operationToPerform = "";
        self.currentInputValue = "";
        self.oldValue = "";
        self.valToDisplay = "";
        self.dispatchVal();
    }
    
   
    
    
    
    func setInput(input:String,btnType:BUTTON_TYPE){
        if(btnType == BUTTON_TYPE.ac){
            self.resetAllValues()       //reset all values
            return;
        }
        if(btnType == BUTTON_TYPE.finalResult){//change logic
            print("old",self.oldValue,"current",self.currentInputValue);
            print(self.oldValue.count)
            if(self.oldValue.count == 0 || self.currentInputValue.count == 0)
            {
                return;
            }
            self.valToDisplay = String(format:"%g",calc(oldVal: Double(self.oldValue)!, newVal: Double(self.currentInputValue)!));
            print("display",valToDisplay)
            self.oldValue = "";
            self.currentInputValue = self.valToDisplay;
            return;
        }
        
        
        if(btnType == BUTTON_TYPE.operation ){
            if(input == "."){
                    var isDouble = self.currentInputValue.contains(".")
                    if(isDouble){
                        return;
                    }
                
               
                self.currentInputValue = self.currentInputValue + "."
                self.accumulateValue(valueToAccumulate: input)
                return;
                
            }
            self.operationToPerform = input;
            self.accumulateValue(valueToAccumulate: input)
            return;
        }
        
        
        if(btnType == BUTTON_TYPE.number){
            self.currentInputValue = self.currentInputValue + input
            self.accumulateValue(valueToAccumulate: input)
        }
    }
    
    
}

