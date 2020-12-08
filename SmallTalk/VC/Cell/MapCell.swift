//
//  MapCell.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 10.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

//import UIKit
//import MapKit
//import CoreLocation
//
//class MapCell: UICollectionViewCell, GeneralVCConfigurationCell {
//    static var reuseId: String = "Map"
//
//
//        let Map = MKMapView()
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            backgroundColor = .white
//            setupConstraints()
//
//            self.clipsToBounds = true
//        }
//
//        func configure(with value: MGeneral) {
//            print("123")
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//}
//// MARK: - Setup constraints
//extension MapCell {
//    private func setupConstraints() {
//        Map.translatesAutoresizingMaskIntoConstraints = false
//
//
//        addSubview(Map)
//
//        NSLayoutConstraint.activate([
//            Map.topAnchor.constraint(equalTo: self.topAnchor),
//            Map.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            Map.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            Map.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//
//    }
//}
//
//// MARK: - SwiftUI
//import SwiftUI
//
//struct MapProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//
//    struct ContainerView: UIViewControllerRepresentable {
//
//        let tabBarVC = MainTabBarViewController()
//
//        func makeUIViewController(context: UIViewControllerRepresentableContext<MapProvider.ContainerView>) -> MainTabBarViewController {
//            return tabBarVC
//        }
//
//        func updateUIViewController(_ uiViewController: MapProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MapProvider.ContainerView>) {
//
//        }
//    }
//}
