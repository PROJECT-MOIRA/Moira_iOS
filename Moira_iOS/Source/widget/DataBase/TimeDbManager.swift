//
//  TimeDbManager.swift
//  Moira_iOS
//
//  Created by Dev.Young on 26/08/2020.
//

import Foundation
import RxSwift
import RealmSwift

class TimeDbManager: BaseDbManager {
    lazy var realm:Realm! = getReam()
    
//    func saveTimeTable(timeTableList: Array<Time>) -> Single<Void> {
//        return Single<Void>.create { [unowned self] single in
//            do{
//                try self.realm.write {
//                    self.realm.delete(self.realm.objects(Time.self))
//                    self.realm.add(timeTableList)
//                }
//                single(.success(Void()))
//            }
//            catch{
//                single(.error(DataBaseError.Custom(message: "Failed to save timeTable data")))
//            }
//            return Disposables.create()
//        }
//    }
//
//    func getAllTimeTable() -> Single<Array<Time>> {
//        return Single<Array<Time>>.create { [unowned self] single in
//            let data = self.realm.objects(Time.self)
//
//            if(data.isEmpty){
//                single(.error(DataBaseError.Custom(message: "Failed to get timeTable data")))
//            }else{
//                single(.success(Array(data)))
//            }
//
//            return Disposables.create()
//        }
//    }
//
//    func deleteAllTimeTable() -> Single<Void>{
//        return Single<Void>.create { [unowned self] single in
//            do{
//                try self.realm.write {
//                    self.realm.delete(self.realm.objects(Time.self))
//                }
//                single(.success(Void()))
//            }
//            catch{
//                single(.error(DataBaseError.Custom(message: "Failed to save timeTable data")))
//            }
//            return Disposables.create()
//        }
//    }
}
