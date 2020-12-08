//
//  MessageTableViewCell.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 10.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import SDWebImage

class MessageTableViewCell: UITableViewCell, SelfConfiguringCell {
    static var reuseId: String = ""

    @IBOutlet weak var userPhoto: UIImageView! {
        didSet {
            userPhoto.clipsToBounds = true
            userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2
        }
    }
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        userName.text = "\(chat.friendUsername) \(chat.friendUserSurname)"
        lastMessage.text = chat.lastMessageContent
        userPhoto.sd_setImage(with: URL(string: chat.friendAvatarStringURL), completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
