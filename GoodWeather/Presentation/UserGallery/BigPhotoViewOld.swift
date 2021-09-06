//
//  BigPhotoView.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 02.09.2021.
//

import UIKit

class BigPhotoViewOld: UIView {
    
    private var leftView: UIImageView = {
        let leftView = UIImageView()
        leftView.isHidden = true
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.contentMode = .scaleAspectFit
        return leftView
    }()
    private var visibleView: UIImageView = {
        let visibleView = UIImageView()
        visibleView.translatesAutoresizingMaskIntoConstraints = false
        visibleView.contentMode = .scaleAspectFit
        return visibleView
    }()
    private var rightView: UIImageView = {
        let rightView = UIImageView()
        rightView.isHidden = true
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.contentMode = .scaleAspectFit
        return rightView
    }()
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = ""
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private var decriptionLabel: UILabel = {
        let decriptionLabel = UILabel()
        decriptionLabel.text = ""
        decriptionLabel.textColor = .white
        decriptionLabel.textAlignment = .center
        decriptionLabel.font = UIFont.boldSystemFont(ofSize: 17)
        decriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return decriptionLabel
    }()
    
    private var panGesture: UIPanGestureRecognizer?
    private var beginCenterXVisibleView: CGFloat = 0
    private var beginCenterXRightView: CGFloat = 0
    private var beginCenterXLeftView: CGFloat = 0
    private let scale = CGAffineTransform(scaleX: 0.85, y: 0.85)

    var namePhoto: [String] = []
    var gallery: [String] = []
    var decription: [String] = []
    var visibleIndex: Int = 0
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
        setGesture()
        setPhotos()
        beginCenterXVisibleView = visibleView.center.x
        beginCenterXRightView = rightView.center.x
        beginCenterXLeftView = leftView.center.x
    }
    
    private func setViews() {
        addSubview(leftView)
        addSubview(rightView)
        addSubview(visibleView)
        addSubview(nameLabel)
        addSubview(decriptionLabel)
                
        visibleView.frame = self.bounds
        
        NSLayoutConstraint.activate([
            visibleView.widthAnchor.constraint(equalTo: self.widthAnchor),
            visibleView.heightAnchor.constraint(equalTo: self.widthAnchor),
            visibleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            visibleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            leftView.widthAnchor.constraint(equalTo: self.widthAnchor),
            leftView.heightAnchor.constraint(equalTo: self.widthAnchor),
            leftView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftView.trailingAnchor.constraint(equalTo: visibleView.leadingAnchor, constant: -15),
            
            rightView.widthAnchor.constraint(equalTo: self.widthAnchor),
            rightView.heightAnchor.constraint(equalTo: self.widthAnchor),
            rightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightView.leadingAnchor.constraint(equalTo: visibleView.trailingAnchor, constant: 15),
            
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.widthAnchor.constraint(equalToConstant: 370),
            
            decriptionLabel.bottomAnchor.constraint(equalTo: visibleView.bottomAnchor, constant: 10),
            decriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            decriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            decriptionLabel.widthAnchor.constraint(equalToConstant: 370),
  
        ])
        
        
    }
    
    private func setGesture() {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        guard let gesture = panGesture else {
            print("panGesture is not initial")
            return
        }
        visibleView.addGestureRecognizer(gesture)
    }
    
    private func setPhotos() {
        guard
            !gallery.isEmpty,
            gallery.count > visibleIndex && visibleIndex >= 0
        else {
            print("Error index for visible view")
            return
        }
        visibleView.image = UIImage(named: gallery[visibleIndex])
        leftView.image = UIImage(named: gallery[earlyIndex()])
        rightView.image = UIImage(named: gallery[nextIndex()])
        nameLabel.text = namePhoto[visibleIndex]
        decriptionLabel.text = decription[visibleIndex]
        visibleView.isUserInteractionEnabled = true
    }
    
    @IBAction private func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.visibleView)
        if let visibleViewRecogniser = recognizer.view {
            visibleViewRecogniser.center.x = visibleViewRecogniser.center.x + translation.x
            leftView.center.x = leftView.center.x + translation.x
            rightView.center.x = rightView.center.x + translation.x
            
            rightView.isHidden = false
            leftView.isHidden = false
            
            firstTransformAnimate()
        }
        recognizer.setTranslation(.zero, in: self.visibleView)
        if recognizer.state == .ended {
            let offset = beginCenterXVisibleView - visibleView.center.x
            if offset > 100 {
                startAnimate(.left)
            } else if offset < -100 {
                startAnimate(.right)
            } else {
                startAnimate(.revert)
            }
        }
    }
    
   
    private func nextIndex() -> Int {
        let lastIndex = gallery.count - 1
        if lastIndex == visibleIndex {
            return 0
        } else {
            return visibleIndex + 1
        }
    }
    
    private func earlyIndex() -> Int {
        let lastIndex = gallery.count - 1
        if visibleIndex == 0 {
            return lastIndex
        } else {
            return visibleIndex - 1
        }
    }
    
//MARK:- Animation
    
    enum DirectionAnimation {
        case left
        case right
        case revert
    }
    
    // Анимация перехода изображения
    private func startAnimate(_ direction: DirectionAnimation) {
        visibleView.isUserInteractionEnabled = false
        self.leftView.isHidden = false
        self.rightView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            switch direction {
            case .revert:
                self.visibleView.center.x = self.beginCenterXVisibleView
                self.leftView.center.x = self.beginCenterXLeftView
                self.rightView.center.x = self.beginCenterXRightView
//                self.transformAnimate()
            case .left:
                self.visibleView.center.x = self.beginCenterXLeftView
                self.rightView.center.x = self.beginCenterXVisibleView
                self.visibleIndex = self.nextIndex()
//                self.transformAnimate()
            case .right:
                self.visibleView.center.x = self.beginCenterXRightView
                self.leftView.center.x = self.beginCenterXVisibleView
                self.visibleIndex = self.earlyIndex()
//                self.transformAnimate()
            }
        } completion: { _ in
            self.transformAnimate()
//            self.visibleView.isUserInteractionEnabled = true
            self.visibleView.center.x = self.beginCenterXVisibleView
            self.leftView.center.x = self.beginCenterXLeftView
            self.rightView.center.x = self.beginCenterXRightView
            self.leftView.isHidden = true
            self.rightView.isHidden = true
            self.setPhotos()
        }
    }
    
   // Анимация плавного завершения перехода (наплывания) и затухания названия
   private func transformAnimate() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseOut,],
            animations: { [unowned self] in
                self.visibleView.transform = .identity
                self.rightView.transform = .identity
                self.leftView.transform = .identity
                if self.nameLabel.alpha == 0 {
                    self.nameLabel.alpha = 1
                } else {
                    self.nameLabel.alpha = 0
                }
            }, completion: { _ in
                self.visibleView.isUserInteractionEnabled = true
                self.nameLabel.alpha = 1
                //self.labelAlphaAnimate()
            })
    }
    
    // Анимация отдаления фото при прокручивании
    private func firstTransformAnimate() {
         UIView.animate(
            withDuration: 0.7,
             delay: 0,
             options: [.curveEaseOut,],
             animations: { [unowned self] in
                visibleView.transform = scale
                rightView.transform = scale
                leftView.transform = scale
             }, completion: nil )
     }
    
    
    
}
    

