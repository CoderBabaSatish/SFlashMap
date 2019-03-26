//
//  ViewController.swift
//  SFlashMap
//
//  Created by Satish on 3/24/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: SFBaseViewController  {
   
    /**
     *   MARK: - Properties
     */
    var vehicleMarkers: [SFVehicleMArker] = []
    var vehicleList: [SFVehicleModel] = []

    @IBOutlet weak var mapView: MKMapView!
    //MARK: Global Declarations
    let regionRadius: CLLocationDistance = 5000
    //MARK: Global Declarations
    let initialLocation = CLLocationCoordinate2DMake(52.523395, 13.391386)// 0,0 coordinates
    
    //MARK: - Annotations
    //MARK: - Overlays
    //MARK: - Map setup
    //MARK: - Life Cycle
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        // MARK: set initial location.
        resetRegion()
        // MARK: set MAP delegate.
        mapView.delegate = self
        mapView.register(SFVehicleMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
       
        // MARK: Load data with web services and pars.
        loadInitialData()
        // MARK: Add Annotations
        mapView.addAnnotations(self.vehicleMarkers)
        
    }
    
    //MARK: - Map setup
    func resetRegion(){
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
    }
    
 /**
  * viewDidAppear override method call
  */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    
   /**
    * MARK: - CLLocationManager
    */
    let locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        /*
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
              mapView.showsUserLocation = true
            } else {
              locationManager.requestWhenInUseAuthorization()
            }
       */
    }
    
    // MARK: - Helper methods
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    /**
     *loadInitialData() - Web service call
     * Parse using parser
     * load data to map
     */
    func loadInitialData() {
        
        //----show progress indicator----
        self.showProgressView()
        //--Network call---
        
        
        SFNetworkingHelper().initiateNetwordCallGet(method: SFConstant().VEHICLES_LIST) { (response, error) in
            
            self.vehicleList = (response ?? nil)!
            print("loadInitialData: Sucess", self.vehicleList)
            
            //---Looping to
            for vehiclemodel in self.vehicleList {
                
                let coordinate = CLLocationCoordinate2D(latitude: vehiclemodel.latitude ?? 0.0, longitude: vehiclemodel.longitude ?? 0.0)
                let vehicleMarker = SFVehicleMArker(title: vehiclemodel.description!, locationName: vehiclemodel.name!, discipline: vehiclemodel.name!, coordinate: coordinate, vehiclemodel: vehiclemodel)
                 // vehicleMarker.
                self.vehicleMarkers.append(vehicleMarker)
              
            }
            print("self.vehicleMarkers Count: ", self.vehicleMarkers.count, self.vehicleMarkers)
            
            self.mapView.addAnnotations(self.vehicleMarkers)
            // reload map.
            self.mapView.reloadInputViews()

            //----hide progress indicator----
             self.hideProgressView()
        }
    }
}

// MARK: - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    
     /* 
      func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? SFVehicleMArker else { return nil }
        // 2
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
          as? MKMarkerAnnotationView { // 3
          dequeuedView.annotation = annotation
          view = dequeuedView
        } else {
          // 4
          view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
          view.canShowCallout = true
          view.calloutOffset = CGPoint(x: -5, y: 5)
          view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
      }
    */
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        
        guard (view.annotation as? SFVehicleMArker) != nil else { return }
        
        let location = view.annotation as! SFVehicleMArker
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]
        
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    
        print("\nmapView: didSelect\n")
        if let annoation = view.annotation as? SFVehicleMArker {
            print("metatag \(annoation.description)")
        }
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.sendSubviewToBack(customView)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("\nmapView: didDeselect\n")
    }

}

//----------------------------End---------------------------------------------------------------------
