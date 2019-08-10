
//  Meme.swift
//  RockPaperScissors
//
//  Created by Adithya.A.N on 02/08/19.
//  Copyright © 2019 mac. All rights reserved.


import Foundation
import UIKit

class Meme  {
    var memes:[test]=[]
    var test:String
    
    init(test:String) {
        self.test = test
    }
    
    
    func getMovies()->Array<test>{
        return self.memes
    }
    
    struct test {
        var topText: String
        var bottomText:String
        var image: UIImage
       
    }

}
