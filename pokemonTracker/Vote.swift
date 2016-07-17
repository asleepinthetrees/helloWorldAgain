//
//  Vote.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation


class Vote {
    
    var Time : NSDate!
    var Vote : VoteType!
    
    init(vote : VoteType, time: NSDate) {
        self.Vote = vote
        self.Time = time
    }
    
    init(vote : VoteType) {
        self.Vote = vote
        self.Time = NSDate()
    }
}

enum VoteType {
    case Yes, No
    
}