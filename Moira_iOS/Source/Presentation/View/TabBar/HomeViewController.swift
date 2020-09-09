//
//  HomeViewController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import UIKit
import RxSwift
import ReactorKit
import Moya
import Toast_Swift

class HomeViewController: UIViewController, StoryboardView{
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var jobCollectionView: UICollectionView!
    @IBOutlet weak var studyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(AuthController.token.isEmpty){
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "moveToLoginPage", sender: self)
            }
        }else{
            reactor = DependencyProvider().container.resolve(HomeViewReactor.self)!
            
            
            Single<Void>.create { single in
                single(.success(Void()))
                return Disposables.create()
            }.asObservable().map { _ in
                return Reactor.Action.getJobStudyPostRequest
            }.bind(to: reactor!.action)
            .disposed(by: disposeBag)
            
            
        }
    }
    
    func bind(reactor: HomeViewReactor) {

        reactor.state.map{ $0.jobPostArray }
            .bind(to: jobCollectionView.rx.items(cellIdentifier: "JobViewCell", cellType: JobViewCell.self)){ (row, element, cell) in
                cell.title.text = element.title
                cell.person_num.text = String(element.people_num)
                cell.field.text = element.field
                cell.content.text = element.description
            }.disposed(by: disposeBag)
        
        reactor.state.map{ $0.studyPostArray }
            .bind(to: studyCollectionView.rx.items(cellIdentifier: "StudyViewCell", cellType: StudyViewCell.self)){ (row, element, cell) in
                cell.title.text = element.title
                cell.person_num.text = String(element.people_num)
                cell.field.text = element.subject
                cell.content.text = element.schedule_description
            }.disposed(by: disposeBag)
        
        // Error
        reactor.error.asObservable().subscribe { error in
            print("====")
            print(error)
            print("====")
            var errorMsg = ""
            if let error = error.element as? NetWorkError {
                switch error {
                case .NetWorkError: break
                case let .Custom(_,errorBody):
                    errorMsg = errorBody["message"] as! String
                }
                
            }else if let error = error.element as? DataBaseError {
                switch error {
                case .DataBaseError: break
                case let.Custom(message):
                    errorMsg = message
                }
                
            }else if let error = error.element as? RxSwift.RxError {
                errorMsg = error.debugDescription
            }
            
            if(errorMsg.isEmpty){
                errorMsg = "알 수 없는 오류"
            }
            
            self.view.makeToast(errorMsg, duration: 2.0, position: .top)
        }.disposed(by: disposeBag)
    }
}

