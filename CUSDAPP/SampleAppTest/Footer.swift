//
//  Footer.swift
//  SampleAppTest
//
//

import UIKit

class Footer {
    
    var name: String
    var selection: Bool

    init(name:String){
        self.name = name
        self.selection = false
    }
    
  func returnFooter() -> String{
    return name;
  }
}

