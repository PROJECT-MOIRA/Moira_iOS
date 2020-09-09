//
//  WriteGetStudyGroupViewController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import UIKit
import RxSwift
import ReactorKit
import Moya
import Toast_Swift

class WriteGetStudyGroupViewController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var person_num: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var content: UITextField!
    @IBOutlet weak var applyButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = DependencyProvider().container.resolve(WriteGetStudyGroupViewReactor.self)!
    }
    
    func bind(reactor: WriteGetStudyGroupViewReactor) {
        applyButton.rx.tap
            .map { [unowned self] _ in
                let request = PostStudyRequest(title:titleLabel.text!,
                                               subject: field.text!,
                                               people_num: Int(person_num.text!)!,
                                               schedule_description: content.text!,
                                               is_deadline: 0,
                                               writer: KeychainService.username!,
                                               contact: contact.text!)
                return Reactor.Action.onClickApply(request)
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isNoProblem }
            .filter{ $0 }
            .bind {[weak self]_ in
                self!.navigationController?.popViewController(animated: true)
                self!.dismiss(animated: true, completion: nil)
                print("글 작성 성공")
            }.disposed(by: disposeBag)
        
        // Error
        reactor.error.asObservable().subscribe { error in
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
