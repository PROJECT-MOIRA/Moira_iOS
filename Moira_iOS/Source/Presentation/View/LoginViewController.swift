//
//  LoginViewController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/09.
//

import UIKit
import ReactorKit
import RxSwift

class LoginViewController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passWorldField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = DependencyProvider().container.resolve(LoginViewReactor.self)!
        userNameField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    func bind(reactor: LoginViewReactor) {
        // Action
        loginButton.rx.tap
            .map { [unowned self] _ in
                let loginRequest = LoginRequest(id: self.userNameField.text!, pw: self.passWorldField.text?.sha512() ?? "")
                return Reactor.Action.login(loginRequest: loginRequest)
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // State
        reactor.state.map { $0.isSuccessLogin }
//            .distinctUntilChanged()
            .filter{ $0 }
            .bind {_ in
                KeychainService.username = self.userNameField.text!
                KeychainService.password = self.passWorldField.text?.sha512()
                DispatchQueue.main.async(){
                    self.performSegue(withIdentifier: "moveToMain", sender: self)
                }
            }.disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .subscribe(onNext: { value in
                if(value){
                    self.startIndicatingActivity()
                }else{
                    self.stopIndicatingActivity()
                }
            }).disposed(by: disposeBag)
        
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
