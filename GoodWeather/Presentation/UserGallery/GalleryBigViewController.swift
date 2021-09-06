//
//  GalleryBigViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 02.09.2021.
//

import UIKit

class GalleryBigViewController: UIViewController {
    
    @IBOutlet var bigPhotoView: BigPhotoView!
    var bigTappedVC: ((Int) -> IndexPath)?
    var bigPhotoes: [Gallery] = []
    var sourceIndexPath: IndexPath = IndexPath()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigPhotoView.gallery = bigPhotoes.map({$0.galleryImage})
        bigPhotoView.visibleIndex = sourceIndexPath.item
        bigPhotoView.namePhoto = bigPhotoes.map({$0.date})
        bigPhotoView.decription = bigPhotoes.map({$0.aboutImage})
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
}
   

