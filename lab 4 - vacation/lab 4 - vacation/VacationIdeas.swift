//
//  VacationIdeas.swift
//  lab 4 - vacation
//
//  Created by Angel Lam on 10/2/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import Foundation

class VacationIdeas {
    var stateVaca : String?
    var countryVaca : String?
    var worldVaca : String?
}

// A more flexible option on how to 'model' an Idea for a vacation spot
// The enum defines a set of options on WHERE an idea is located.  The
// VacationIdea class defines the TITLE and WHERE of a specific idea.

//enum VacationScope:Int {
//    case State
//    case Country
//    case World
//}
//
//class VacationIdea {
//    var title:String?
//    var scope:VacationScope = .State
//}