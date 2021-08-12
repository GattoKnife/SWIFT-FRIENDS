//
//  ViewController.swift
//  GoodWeather
//
//  Created by Nika Reshanova on 06.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder){
        super .init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        // экран (view) ЗАГРУЖЕН
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //уведомляет, что экран БУДЕТ показан
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //уведомляет, что экран УЖЕ показан
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //уведомляет, что экран БУДЕТ скрыт
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //уведомляет, что экран УЖЕ скрыт
    }

}

