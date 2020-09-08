//
//  ParamUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 13/08/2020.
//

import Foundation

protocol ParamUseCase {
    associatedtype Params
    associatedtype T
    func buildUseCaseObservable(params:Params) -> T
}
