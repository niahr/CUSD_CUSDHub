//
//  Post.swift
//  SampleAppTest
//
//

import UIKit

class Post {
    
    var name: String
    var selection: Bool

    init(name:String){
        self.name = name
        self.selection = false
    }
    
  func returnPost() -> String{
    return name;
  }
}
