
import UIKit

final class InteractiveTransition: UIPercentDrivenInteractiveTransition {

	var viewController: UIViewController? {
    //добавляем рекогнайзер на каждый переданный вьюКонтроллер
        didSet {
			let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handle (_:)))
			recognizer.edges = [.left]
			viewController?.view.addGestureRecognizer(recognizer)
		}
	}

	var isStarted: Bool = false
	private var shouldFinish: Bool = false

	@objc func handle(_ recognizer: UIScreenEdgePanGestureRecognizer) {
		switch recognizer.state {
           case .began:
			isStarted = true
			viewController?.navigationController?.popViewController(animated: true)
          
        //пошло движение пальца по экрану
        case .changed:
			let transition = recognizer.translation(in: recognizer.view)
			let relative = transition.x / (recognizer.view?.bounds.width ?? 1)
			let progress = max(0, min(1, relative))

                // % протяжки пальцем для завершения свайпа, сделала такую маленькую, потому что иначе очень туго шло
            self.shouldFinish = progress > 0.1

                //прогресс для анимации
            update(progress)
		case .ended:
			isStarted = false
			shouldFinish ? finish() : cancel()

		case .cancelled:
			isStarted = false
			cancel()
		default:
			return
		}
	}
}
