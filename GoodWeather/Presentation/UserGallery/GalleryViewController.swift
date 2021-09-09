//
//  GalleryViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 19.08.2021.
//

import UIKit

final class GalleryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var gallery: [Gallery] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            // Проверям сегу
            segue.identifier == "goToBigPhoto",
            // Кастим
            let destinationController = segue.destination as? GalleryBigViewController,
            // Сохраняем индексы выбранных изображений
            let indexPaths = collectionView.indexPathsForSelectedItems
        else { return }
        // Кастим чтобы получить не массив
        let indexPath = indexPaths[0] as IndexPath
        // Отправляем
        destinationController.bigPhotoes = gallery
        destinationController.sourceIndexPath = indexPath
    }
}

extension GalleryViewController: UICollectionViewDelegate {

}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryViewCell.identifier, for: indexPath) as! GalleryViewCell
        
        let userGallery = gallery[indexPath.item]
        cell.configure(userGallery)
        cell.likeTapped = { [weak self] isLiked in
            self?.gallery[indexPath.item].isLiked = isLiked
            
        }
        return cell
    }
}
