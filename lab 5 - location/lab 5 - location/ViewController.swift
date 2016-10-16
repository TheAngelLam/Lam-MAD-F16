//
//  ViewController.swift
//  lab 5 - location
//
//  Created by Angel Lam on 10/15/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()

    @IBOutlet weak var mapView: MKMapView!
    
    //new location is available
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(manager.location!.coordinate, span)
        mapView.setRegion(region, animated: true)
        
        //annotations
        annotation.coordinate = manager.location!.coordinate
        annotation.title = "You are here"
        annotation.subtitle = "Latitude: \(manager.location!.coordinate.latitude), Longitude: \(manager.location!.coordinate.longitude)"
        mapView.addAnnotation(annotation)
    }
    
    //authorization status changed
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didchangeauthorization")
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    //location cannot be determined
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        var errorType = String()
        if let clError = CLError(rawValue: error.code) {
            if clError == .Denied {
                errorType = "access denied"
                let alert = UIAlertController(title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.mapType = MKMapType.Standard
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

