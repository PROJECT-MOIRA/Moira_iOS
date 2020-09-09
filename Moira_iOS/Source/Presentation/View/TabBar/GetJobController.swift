//
//  GetJobController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import UIKit
import RxSwift
import ReactorKit
import Moya
import Toast_Swift

class GetJobController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var jobCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = DependencyProvider().container.resolve(GetJobViewReactor.self)!
        
        Single<Void>.create { single in
            single(.success(Void()))
            return Disposables.create()
        }.asObservable().map { _ in
            return Reactor.Action.getJobPostRequest
        }.bind(to: reactor!.action)
        .disposed(by: disposeBag)
        
    }
    
    func bind(reactor: GetJobViewReactor) {
        reactor.state.map{ $0.jobPostArray }
            .bind(to: jobCollectionView.rx.items(cellIdentifier: "JobMoreViewCell", cellType: JobMoreViewCell.self)){ (row, element, cell) in
                cell.title.text = element.title
                cell.people_num.text = String(element.people_num)
                cell.field.text = element.field
                cell.content.text = element.description
            }.disposed(by: disposeBag)
    }
}
