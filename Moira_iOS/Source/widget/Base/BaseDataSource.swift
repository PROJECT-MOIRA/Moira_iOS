//
//  BaseDataSource.swift
//  Moira_iOS
//
//  Created by Dev.Young on 29/07/2020.
//

import Foundation
import Moya

class BaseDataSource <RM, CH>{
    let remote:RM
    let cache:CH
    
    init(remote:RM, cache:CH){
        self.remote = remote
        self.cache = cache
    }
}
