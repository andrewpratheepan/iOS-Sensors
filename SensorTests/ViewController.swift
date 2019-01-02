//
//  ViewController.swift
//  SensorTests
//
//  Created by Edward Lemaire on 2018-05-08.
//  Copyright © 2018 Edward Lemaire. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController:  UIViewController {
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    var xacc = [Double]()
    var yacc = [Double]()
    var zacc = [Double]()
    
    
    @IBOutlet weak var press: UIButton!
    
    var motion = CMMotionManager()
    var change = false
    @IBAction func press(_ sender: Any) {
        x.text = "x:"
        y.text = "y:"
        z.text = "z:"
        change = !change
        //  print("test \(change)")
        if change == false {
            //press.isEnabled = false
        }
        self.fileinator(xa: self.xacc)
    }
    func accg() {
        motion.accelerometerUpdateInterval = 0.02
        motion.startAccelerometerUpdates(to: OperationQueue.current!){
            (data, er) in
            //print("whoops")
            if let myD = data{
                
                if self.change == true{
                    //print("working...")
                    //let cd = CMAcceleration()
                    self.x.text = "x: \(myD.acceleration.x)"
                    self.y.text = "y: \(myD .acceleration.y)"
                    self.z.text = "z: \(myD.acceleration.z)"
                    self.xacc.append(myD.acceleration.x)
                    self.yacc.append(myD.acceleration.y)
                    self.zacc.append(myD.acceleration.z)
                    //print(myD.acceleration)
                    //if (abs(myD.acceleration.z) > 5 || abs(myD.acceleration.x) > 5 || abs(myD.acceleration.y) > 5){
                    //print(myD.acceleration, "gravity")
                    //print(myD.acceleration.x*(-9.81), "\t", myD.acceleration.y*(-9.81), "\t",myD.acceleration.z*(-9.81))
                    //print(myD.timestamp)
                    //}
                    //self.view.reloadInputViews()
                }
            }
            
            
        }
    }
    func acclin(){
        motion.deviceMotionUpdateInterval = 0.02
        motion.startDeviceMotionUpdates(to: OperationQueue.current!){ (data, error) in
            if self.change == true{
                if let d = data{
                    //print(d.userAcceleration, "no gravity")
                    //print(d.userAcceleration.x)
                    //print(d.timestamp)
                    //print(d.userAcceleration.x*(-9.81), "\t", d.userAcceleration.y*(-9.81), "\t",d.userAcceleration.z*(-9.81))
                }
            }
        }
    }
    func gyro() {
        motion.gyroUpdateInterval = 0.02
        motion.startGyroUpdates(to: OperationQueue.current!){
            (data,error) in
            if self.change == true{
                if let gyroData = data{
                    //print(gyroData.rotationRate)
                }
            }
            
        }
    }
    func magno(){
        motion.magnetometerUpdateInterval = 0.2
        motion.startMagnetometerUpdates(to: OperationQueue.current!){
            (data,error) in
            if self.change == true{
                if let mag = data{
                    print(mag)
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        accg()
        acclin()
        gyro()
        magno()
    }
    
    func fileinator(xa:[Double]){
        let xfile = "xacc.txt"
        let value = xa.description
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(xfile)
            do {
                try value.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
                print("ERROR!!!!")
            }
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                //print(text2)
                //self.motion.stopAccelerometerUpdates()
            }
            catch {print("Check file")}
            
        }
    }
    
    
    
}

