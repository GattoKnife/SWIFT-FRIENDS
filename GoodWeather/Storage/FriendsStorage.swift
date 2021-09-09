//
//  FriendsStorage.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 18.08.2021.
//

import Foundation

class FriendsStorage {
    var friends: [Friend]
    let allFriends: [Friend]
    
    init() {
        friends = [
            Friend(name: "Bregor Samonetti", userPic: "Bregor", gallery: [
                Gallery(date: "17-01-1265", galleryImage: "enterOndol", aboutImage: "Main entrance to Ondol, capital of Tabirnia", isLiked: true, numbersOfLike: 14),
                Gallery(date: "17-01-1265", galleryImage: "OndolPort", aboutImage: "Biggest trade port of Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "MiglathPort", aboutImage: "Leaving Miglath", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "seaSore", aboutImage: "Misty seashore near the Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "Fontekina", aboutImage: "Small city far from all capitals", isLiked: true, numbersOfLike: 28),
                Gallery(date: "20-02-1265", galleryImage: "Farugue", aboutImage: "Capital of Kilderein is really impressive!", isLiked: false, numbersOfLike: 14),
                Gallery(date: "03-04-1265", galleryImage: "fff", aboutImage: "Just arrive to Farugue", isLiked: false, numbersOfLike: 14)
                        ]
        ),
            Friend(name: "Mirf Seamoh", userPic: "Mirf", gallery: [
                Gallery(date: "04-06-1263", galleryImage: "Castle", aboutImage: "Castle of Dunabroh, capital of Nidin", isLiked: false, numbersOfLike: 14),
                Gallery(date: "12-08-1264", galleryImage: "duna_lake", aboutImage: "The clearest lake you ever see!", isLiked: true, numbersOfLike: 34),
                Gallery(date: "05-07-1264", galleryImage: "Dunabrogh", aboutImage: "Dunabrogh is always in my heart", isLiked: false, numbersOfLike: 14),
                Gallery(date: "12-08-1264", galleryImage: "lakeOfDreams", aboutImage: "Make a wish on the Lake of Dreams", isLiked: false, numbersOfLike: 14),
                Gallery(date: "28-09-1265", galleryImage: "Sittolby", aboutImage: "Fishermen's village", isLiked: true, numbersOfLike: 41),
                Gallery(date: "12-08-1264", galleryImage: "mist", aboutImage: "you will never forget mists of Nidin...", isLiked: false, numbersOfLike: 14),
                Gallery(date: "30-03-1263", galleryImage: "worrior", aboutImage: "best worriors you will find here!", isLiked: false, numbersOfLike: 14)
        ]
        )
        ]
        
        allFriends = [
            Friend(name: "Mirf Seamoh", userPic: "Mirf", gallery: [
                Gallery(date: "04-06-1263", galleryImage: "Castle", aboutImage: "Castle of Dunabroh, capital of Nidin", isLiked: false, numbersOfLike: 14),
                Gallery(date: "12-08-1264", galleryImage: "duna_lake", aboutImage: "The clearest lake you ever see!", isLiked: true, numbersOfLike: 34),
                Gallery(date: "05-07-1264", galleryImage: "Dunabrogh", aboutImage: "Dunabrogh is always in my heart", isLiked: false, numbersOfLike: 14),
                Gallery(date: "12-08-1264", galleryImage: "lakeOfDreams", aboutImage: "Make a wish on the Lake of Dreams", isLiked: false, numbersOfLike: 14),
                Gallery(date: "28-09-1265", galleryImage: "Sittolby", aboutImage: "Fishermen's village", isLiked: true, numbersOfLike: 41),
                Gallery(date: "12-08-1264", galleryImage: "mist", aboutImage: "you will never forget mists of Nidin...", isLiked: false, numbersOfLike: 14),
                Gallery(date: "30-03-1263", galleryImage: "worrior", aboutImage: "best worriors you will find here!", isLiked: false, numbersOfLike: 14)
            ]
           ),
            Friend(name: "Kahli Miu", userPic: "Kahli", gallery: [
                Gallery(date: "12-06-1263", galleryImage: "Castle", aboutImage: "Castle of Dunabroh, capital of Nidin", isLiked: false, numbersOfLike: 14),
                Gallery(date: "12-06-1263", galleryImage: "Castle", aboutImage: "Castle of Dunabroh, capital of Nidin", isLiked: false, numbersOfLike: 14),
                Gallery(date: "12-06-1263", galleryImage: "Castle", aboutImage: "Castle of Dunabroh, capital of Nidin", isLiked: false, numbersOfLike: 14)
            
        ]
        ),
            Friend(name: "Bregor Samonetti", userPic: "Bregor", gallery: [
                Gallery(date: "17-01-1265", galleryImage: "enterOndol", aboutImage: "Main entrance to Ondol, capital of Tabirnia", isLiked: true, numbersOfLike: 14),
                Gallery(date: "17-01-1265", galleryImage: "OndolPort", aboutImage: "Biggest trade port of Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "MiglathPort", aboutImage: "Leaving Miglath", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "seaSore", aboutImage: "Misty seashore near the Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "Fontekina", aboutImage: "Small city far from all capitals", isLiked: true, numbersOfLike: 28),
                Gallery(date: "20-02-1265", galleryImage: "Farugue", aboutImage: "Capital of Kilderein is really impressive!", isLiked: false, numbersOfLike: 14),
                Gallery(date: "03-04-1265", galleryImage: "fff", aboutImage: "Just arrive to Farugue", isLiked: false, numbersOfLike: 14)
        ]
        ),
        Friend(name: "Krayv Kamievo", userPic: "Krayv", gallery: [
            Gallery(date: "17-01-1265", galleryImage: "enterOndol", aboutImage: "Main entrance to Ondol, capital of Tabirnia", isLiked: false, numbersOfLike: 14),
            Gallery(date: "17-01-1265", galleryImage: "OndolPort", aboutImage: "Biggest trade port of Ondol", isLiked: false, numbersOfLike: 14),
            Gallery(date: "20-02-1265", galleryImage: "seaSore", aboutImage: "Misty seashore near the Ondol", isLiked: false, numbersOfLike: 14)
        ]
        ),
            Friend(name: "Marus Marua", userPic: "Marus", gallery: [
                Gallery(date: "17-01-1265", galleryImage: "enterOndol", aboutImage: "Main entrance to Ondol, capital of Tabirnia", isLiked: false, numbersOfLike: 14),
                Gallery(date: "17-01-1265", galleryImage: "OndolPort", aboutImage: "Biggest trade port of Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "seaSore", aboutImage: "Misty seashore near the Ondol", isLiked: false, numbersOfLike: 14)
                ]
            ),
            Friend(name: "Gabrellos Thorjon", userPic: "Gabrellos", gallery: [
                Gallery(date: "17-01-1265", galleryImage: "enterOndol", aboutImage: "Main entrance to Ondol, capital of Tabirnia", isLiked: false, numbersOfLike: 14),
                Gallery(date: "17-01-1265", galleryImage: "OndolPort", aboutImage: "Biggest trade port of Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "seaSore", aboutImage: "Misty seashore near the Ondol", isLiked: false, numbersOfLike: 14)
                ]
            ),
            Friend(name: "Lorius Rovievo", userPic: "Lorius", gallery: [
                Gallery(date: "17-01-1265", galleryImage: "enterOndol", aboutImage: "Main entrance to Ondol, capital of Tabirnia", isLiked: false, numbersOfLike: 14),
                Gallery(date: "17-01-1265", galleryImage: "OndolPort", aboutImage: "Biggest trade port of Ondol", isLiked: false, numbersOfLike: 14),
                Gallery(date: "20-02-1265", galleryImage: "seaSore", aboutImage: "Misty seashore near the Ondol", isLiked: false, numbersOfLike: 14)
                ]
            )
                    
        ]
    }
}
