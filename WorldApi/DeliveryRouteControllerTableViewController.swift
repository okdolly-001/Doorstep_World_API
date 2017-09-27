//
//  DeliveryRouteControllerTableViewController.swift
//  hack1
//
//  Created by Ralf Tappmeyer on 9/23/17.
//  Copyright © 2017 Ralf Tappmeyer. All rights reserved.
//

import UIKit
import MapKit

var deliveryList: [String] = ["Personal Shipment #5747834", "Personal Shipment #4778233","Best Buy Mobile Order #199214738","Best Buy Mobile Order #199214830","Wal-Mart Home Delivery #201084","Safeway Grocery Delivery #2382","Amazon Shipment #1946","Amazon Shipment #1949"]


class DeliveryRouteControllerTableViewController: UITableViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapView.showsUserLocation = true
        let coordinate: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(37.408384, -122.143464);
        let latitudinalMeters: CLLocationDistance = 10000
        let longitudinalMeters: CLLocationDistance = 10000
        let region = MKCoordinateRegionMakeWithDistance(coordinate, latitudinalMeters, longitudinalMeters)
        self.mapView.setRegion(region, animated: true) // Set to yes to animate, you said initial load so I image this won't be visible anyways.

        let annotation = MKPointAnnotation()
        let annotation1 = MKPointAnnotation()
        let annotation2 = MKPointAnnotation()
        let annotation3 = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.408384,longitude: -122.143464)
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.45512,longitude: -122.149167)
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.433753,longitude: -122.13478)
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 37.4654,longitude: -122.143434)
        annotation.title = "Eric"
        annotation1.title = "Amy"
        annotation2.title = "Dave"
        annotation3.title = "Mary"
        self.mapView.addAnnotation(annotation)
        self.mapView.addAnnotation(annotation1)
        self.mapView.addAnnotation(annotation2)
        self.mapView.addAnnotation(annotation3)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addPackage(_ sender: Any) {
        
        deliveryList.append("Package")
        /*tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: deliveryList.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()*/
        print(deliveryList)
    }
    
    
    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 8
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
