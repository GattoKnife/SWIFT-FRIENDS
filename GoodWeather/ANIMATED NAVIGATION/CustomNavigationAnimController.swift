//
//  CustomNavigationAnimController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 08.09.2021.
//

import UIKit

final class CustomNavigationAnimController: UINavigationController {

    let interactiveTransition = InteractiveTransition()

        //указываем что Навигейшен Контроллер сам себе делегат
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension CustomNavigationAnimController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return interactiveTransition.isStarted ? interactiveTransition : nil
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            if navigationController.viewControllers.first != toVC {
                interactiveTransition.viewController = toVC
            }
            return PopAnimator()
        case .push:
            interactiveTransition.viewController = toVC
            return PushAnimator()
        default:
            return nil
        }
    }
}
