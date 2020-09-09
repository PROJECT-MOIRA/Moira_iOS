//
//  StudyGroupViewerViewController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import UIKit
import RxSwift
import ReactorKit
import Moya
import Toast_Swift

class StudyGroupViewerViewController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var person_num: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = DependencyProvider().container.resolve(StudyGroupViewerViewReactor.self)!
    }
    
    func bind(reactor: StudyGroupViewerViewReactor) {
        
    }
}
