//
//  ChatsNavBar.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 08.07.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SDWebImage 

class ChatsNavBar: UIView {
    
    var friend: MChat!

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "\(friend.friendUsername) \(friend.friendUserSurname)"
        }
    }
    @IBOutlet weak var statusLabel: UILabel! {
        didSet {
            
        }
    }
    @IBOutlet weak var imageUser: UIImageView! {
        didSet {
            imageUser.image = #imageLiteral(resourceName: "human2")
        }
    }
    
    @IBOutlet weak var Content: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit() {
        let bundle = Bundle(for: ChatsNavBar.self)
        bundle.loadNibNamed("ChatsNavBar", owner: self, options: nil)
        addSubview(Content)
        Content.frame = self.bounds
        Content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
