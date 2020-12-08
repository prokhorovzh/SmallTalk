//
//  MessegeVC.swift
//  
//
//  Created by Евгений Прохоров on 06.06.2020.
//

import UIKit
import FirebaseFirestore

class MessageVC: UITableViewController {
    
    var chat = [MChat]()
    var currentUser: MUser!
    var senderUser: MChat!
    
    private var chatsListener: ListenerRegistration?
    
    deinit {
        chatsListener?.remove()
    }
    
    @IBOutlet weak var SegmentedControl: UISegmentedControl! {
        didSet {
            SegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            SegmentedControl.tintColor = .blue
            SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .selected)
            SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
            tableView.reloadData()
        
        chatsListener = ListenerService.shared.chatsObserve(chats: chat, completion: { (result) in
            switch result {
                
            case .success(let chat):
                self.chat = chat
                self.tableView.reloadData()
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        })
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    //MARK: TableView Data Sourse
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        let objc = chat[indexPath.row]
        cell.lastMessage.text = objc.lastMessageContent
        cell.userName.text = "\(objc.friendUsername) \(objc.friendUserSurname)"
        cell.userPhoto.sd_setImage(with: URL(string: objc.friendAvatarStringURL), completed: nil)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chatsVC = ChatsViewController(user: currentUser, chat: chat[indexPath.row])
        navigationController?.pushViewController(chatsVC, animated: true)
        //present(chatsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = deleteChat(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done])
    }
    
    func deleteChat(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.chat.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.removeChat(chat: self.chat.remove(at: indexPath.row))
            completion(true)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "xmark.circle.fill")
        action.title = "Delete"
        return action
    }
    
    func removeChat(chat: MChat) {
        FirestoreServices.shared.deleteChat(chat: chat) { (result) in
            switch result {
            case .success:
                self.showAlert(with: "Успешно!", and: "Чат с \(chat.friendUsername) был удален")
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
    }
    
}

extension MessageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


