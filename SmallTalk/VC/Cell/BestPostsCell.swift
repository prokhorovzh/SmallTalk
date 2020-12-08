//
//  BestPostsCell.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 09.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

//import UIKit
//
//class BestPostsCell: UICollectionViewCell, GeneralVCConfigurationCell {
//    
//    static var reuseId: String = "RaitingCell"
//    
//    
//    let PostImageView = UIImageView()
////    let friendName = UILabel(text: "User Name", font: .laoSangamMN20())
////    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .white
//        setupConstraints()
//        
//        self.clipsToBounds = true
//    }
//    
//    func configure(with value: MGeneral) {
//        PostImageView.image = UIImage(named: value.userImageString)
////        friendName.text = value.username
////        lastMessage.text = value.lastMessage
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//// MARK: - Setup constraints
//extension BestPostsCell {
//    private func setupConstraints() {
//        PostImageView.translatesAutoresizingMaskIntoConstraints = false
////        friendName.translatesAutoresizingMaskIntoConstraints = false
////        lastMessage.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        PostImageView.backgroundColor = .black
//        PostImageView.clipsToBounds = true
//        PostImageView.contentMode = .scaleAspectFill
//        
//        addSubview(PostImageView)
////        addSubview(friendName)
////        addSubview(lastMessage)
//        
//        NSLayoutConstraint.activate([
//            PostImageView.topAnchor.constraint(equalTo: self.topAnchor),
//            PostImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            PostImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            PostImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//        
////        NSLayoutConstraint.activate([
////            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
////            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
////            friendName.trailingAnchor.constraint(equalTo: self.trailingAnchor)
////        ])
////
////        NSLayoutConstraint.activate([
////            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
////            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
////            lastMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
////        ])
//    }
//}
//
//// MARK: - SwiftUI
//import SwiftUI
//
//struct BestPostsProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct ContainerView: UIViewControllerRepresentable {
//        
//        let tabBarVC = MainTabBarViewController()
//        
//        func makeUIViewController(context: UIViewControllerRepresentableContext<BestPostsProvider.ContainerView>) -> MainTabBarViewController {
//            return tabBarVC
//        }
//        
//        func updateUIViewController(_ uiViewController: BestPostsProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<BestPostsProvider.ContainerView>) {
//            
//        }
//    }
//}
