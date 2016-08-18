//
//  forwardViewController.swift
//  player
//
//  Created by 杜鋆 on 06/03/2016.
//  Copyright © 2016 杜鋆. All rights reserved.
//

import UIKit
import MapKit
class forwardViewController: UIViewController {
    var peopleModel = People(fromXMLFile: "people.xml")
    
    var v : Int!
    var person : Person!
    
    var personArray = [Person]()
    
    var index = 0
    var l :Double!
    var long : Double!
    
    @IBOutlet weak var change: UISegmentedControl!
    
    @IBAction func change(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapview.mapType = .Standard
        case 1:
            mapview.mapType = .Satellite
        case 2:
            mapview.mapType = .Hybrid
        default:
            mapview.mapType = .Satellite
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Person Info"
        index = v
        l = Double(person.latitude)
        long = Double(person.longitude)
        var location = CLLocationCoordinate2D(
            latitude: l,
            longitude: long
        )
        
        var span = MKCoordinateSpanMake(0.1, 0.1)
        var region = MKCoordinateRegion(center: location, span: span)
        
        mapview.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = person.marker
        
        
        mapview.addAnnotation(annotation);
        if person != nil{
            name.text = person.name
            address.text = person.club
            age.text = person.num
            country.text = person.country
            des.text = person.des
            personimage.image = UIImage(named: person.image)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var mapview: MKMapView!
    
    @IBOutlet weak var des: UITextView!
    
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var personimage: UIImageView!
    @IBAction func next(sender: AnyObject) {
        index++
        if(index >= peopleModel.data.count){
            index = 0
        }
        name.text = peopleModel.data[index].name
        age.text = peopleModel.data[index].num
        country.text = peopleModel.data[index].country
        address.text=peopleModel.data[index].club
        des.text = peopleModel.data[index].des
        personimage.image = UIImage(named: peopleModel.data[index].image)
        
        l = Double(peopleModel.data[index].latitude)
        long = Double(peopleModel.data[index].longitude)
        var location = CLLocationCoordinate2D(
            latitude: l,
            longitude: long
        )
        
        var span = MKCoordinateSpanMake(0.5, 0.5)
        var region = MKCoordinateRegion(center: location, span: span)
        
        mapview.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = peopleModel.data[index].marker
        
        
        mapview.addAnnotation(annotation);
        
        
        
    }
    @IBAction func pre(sender: AnyObject) {
        
        index--
        if(index < 0){
            index = peopleModel.data.count - 1
        }
        name.text = peopleModel.data[index].name
        age.text = peopleModel.data[index].num
        country.text = peopleModel.data[index].country
        address.text=peopleModel.data[index].club
        des.text = peopleModel.data[index].des
        personimage.image = UIImage(named: peopleModel.data[index].image)
        l = Double(peopleModel.data[index].latitude)
        long = Double(peopleModel.data[index].longitude)
        var location = CLLocationCoordinate2D(
            latitude: l,
            longitude: long
        )
        
        var span = MKCoordinateSpanMake(0.5, 0.5)
        var region = MKCoordinateRegion(center: location, span: span)
        
        mapview.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = peopleModel.data[index].marker
        
        
        
        mapview.addAnnotation(annotation);
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue" {
            let controller = segue.destinationViewController as! DetailViewController
            controller.person = self.person
            //            controller.person = peopleModel.data[index]
        }
    }
    
    
    
}