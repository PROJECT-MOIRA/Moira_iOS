//
//  GetStudyMemberViewController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import UIKit
import RxSwift
import ReactorKit
import Moya
import Toast_Swift


class GetStudyMemberViewController: UIViewController, StoryboardView {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var studyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = DependencyProvider().container.resolve(GetStudyMemberViewReactor.self)!
        
        Single<Void>.create { single in
            single(.success(Void()))
            return Disposables.create()
        }.asObservable().map { _ in
            return Reactor.Action.getStudyPostRequest
        }.bind(to: reactor!.action)
        .disposed(by: disposeBag)
    }
    
    func bind(reactor: GetStudyMemberViewReactor) {
        reactor.state.map{ $0.studyPostArray }
            .bind(to: studyCollectionView.rx.items(cellIdentifier: "StudyMoreViewCell", cellType: StudyMoreViewCell.self)){ (row, element, cell) in
                cell.title.text = element.title
                cell.person_num.text = String(element.people_num)
                cell.field.text = element.subject
                cell.content.text = element.schedule_description
            }.disposed(by: disposeBag)
    }
}
