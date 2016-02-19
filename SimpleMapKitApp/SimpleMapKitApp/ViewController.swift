//
//  ViewController.swift
//  SimpleMapKitApp
//
//  Created by Phil Wright on 12/14/15.
//  Copyright © 2015 Touchopia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 
        
            Important: Make sure NSLocationWhenInUseUsageDescription == App needs location to find current location. in Info.plist

        */
        
        self.mapView.delegate = self
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    @IBAction func updateCurrentLocation() {
        
        print("update to Current Location")
        
        let status = CLAuthorizationStatus.AuthorizedWhenInUse
        
        if status != .Denied {
            self.mapView.showsUserLocation = true
            self.locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - LocationManager Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
        
            print("latitude: \(location.coordinate.latitude)\nlongitude:\(location.coordinate.longitude)")
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
            
            self.mapView.setRegion(region, animated: true)
            
            self.locationManager.stopUpdatingLocation()
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error: " + error.localizedDescription)
    }
    
}

