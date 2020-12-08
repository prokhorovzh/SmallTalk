//
//  MapViewController.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 08.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    let mapManager = MapManager()
    let locationManager = CLLocationManager()
    var incomeSegueIdentifier = ""
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        mapManager.setupUserLocation(mapView: mapView)
    }
    
    @IBAction func centerViewInUserLocation() {
        mapManager.showUserLocation(mapView: mapView)
    }
    private func setupMapView() {
        mapManager.checkLocationServices(mapView: mapView, segueIdentifier: incomeSegueIdentifier) {
            mapManager.locationManager.delegate = self
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        mapManager.checkLocationAuthorization(mapView: mapView, segueIdentifier: incomeSegueIdentifier)
    }
}
