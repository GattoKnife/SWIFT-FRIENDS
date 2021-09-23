//
//  isLikedView.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 23.08.2021.
//

import UIKit

class isLikedView: UIControl {
    
    var isLiked: Bool = false{
        didSet {
            sendActions(for: .valueChanged)
            updateControl()
        }
    }
   
    private var likeImage: UIImageView = {
        let likeImage = UIImageView()
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        
        return likeImage
    }()
    private var likeCountLabel = UILabel()
    private var numbersOfLike: Int = 0
    
        
    override init(frame:CGRect){
        super.init(frame: frame)
        setupViews()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupGesture()
    }
    
    func configure (isLiked: Bool, numbersOfLike: Int) {
        self.isLiked = isLiked
        likeCountLabel.text = String(numbersOfLike)
        self.numbersOfLike = numbersOfLike
    }
    
    func updateControl() {
        
        if isLiked {
            likeImage.image = UIImage(systemName: "heart.fill")
            likeCountLabel.text = String(numbersOfLike + 1)
            likeCountLabel.textColor = #colorLiteral(red: 0.7071666128, green: 0.3857842268, blue: 0.4425837933, alpha: 1)
            likeImage.tintColor = #colorLiteral(red: 0.7071666128, green: 0.3857842268, blue: 0.4425837933, alpha: 1)
        } else {
            likeImage.image = UIImage(systemName: "heart")
            likeCountLabel.text = String(numbersOfLike + 1 - 1)
            likeCountLabel.textColor = .lightGray
            likeImage.tintColor = .lightGray
        }
    }
   
    private func setupViews() {
        addSubview(likeImage)
        addSubview(likeCountLabel)
       
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.trailingAnchor.constraint(equalTo: likeImage.leadingAnchor, constant: -6).isActive = true
        likeCountLabel.centerYAnchor.constraint(equalTo: likeImage.centerYAnchor).isActive = true
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)
    }
    
    @objc private func tapped(){
        isLiked.toggle()
        animatedHeart(numbersOfLike: numbersOfLike)
    }
    

   //делала анимацию так же транзишином с флипом, но не смотря на то, что баундом по коду проще - мне понравилось больше.
    private func animatedHeart(numbersOfLike: Int ){
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.likeImage.bounds.size.width -= 8
                        self.likeImage.bounds.size.height -= 8
                        
                         })
  
    }
    
//    private func animatedHeart(numbersOfLike: Int ){
//        UIView.animate(withDuration: 0.5,
//                       animations: {
//                        UIView.modifyAnimations(withRepeatCount: 2, autoreverses: false, animations: {
//                        self.likeImage.bounds.size.width -= 8
//                        self.likeImage.bounds.size.height -= 8
//
//                         })
//    })
//
//    }
}
