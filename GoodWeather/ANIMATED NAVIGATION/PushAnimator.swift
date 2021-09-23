
//анимация прокрутки вперед

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

	private let duration: TimeInterval = 0.5

	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		duration
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let source = transitionContext.viewController(forKey: .from) else { return }
		guard let destination = transitionContext.viewController(forKey: .to) else { return }
        //добавляем сорс и дестинейшен контроллеры на контейнер вью, меняем цвета контейнера
		transitionContext.containerView.addSubview(destination.view)
		transitionContext.containerView.sendSubviewToBack(destination.view)
        transitionContext.containerView.backgroundColor = #colorLiteral(red: 0.827598393, green: 0.8662441969, blue: 0.8556252718, alpha: 1)

            //anchorPoint = "центр тяжести вьюшки". смещаем в правый верхний угол экрана
		destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
		destination.view.frame = transitionContext.containerView.frame
            //выставляем угол поворота (pi -180)
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi/2)

		source.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
		source.view.frame = transitionContext.containerView.frame
        //source.view.backgroundColor = #colorLiteral(red: 0.6431173107, green: 0.7272652695, blue: 0.7212966418, alpha: 1)
        

		UIView.animate(
			withDuration: duration,
			animations: {
				source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
				destination.view.transform = .identity
                
			}) { (isComplete) in
			if isComplete && !transitionContext.transitionWasCancelled {
                

			} else if transitionContext.transitionWasCancelled {
				destination.view.transform = .identity
			}
			transitionContext.completeTransition( isComplete && !transitionContext.transitionWasCancelled)
		}
	}
}
