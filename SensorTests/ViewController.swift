//
//  ViewController.swift
//  SensorTests


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
    }
    func accg() {
        motion.accelerometerUpdateInterval = 0.02
        motion.startAccelerometerUpdates(to: OperationQueue.current!){
            (data, er) in
            if let myD = data{
                
                if self.change == true{
                    self.x.text = "x: \(myD.acceleration.x)"
                    self.y.text = "y: \(myD .acceleration.y)"
                    self.z.text = "z: \(myD.acceleration.z)"
                    self.xacc.append(myD.acceleration.x)
                    self.yacc.append(myD.acceleration.y)
                    self.zacc.append(myD.acceleration.z)
                    
                }
            }
            
            
        }
    }
    func acclin(){
        motion.deviceMotionUpdateInterval = 0.02
        motion.startDeviceMotionUpdates(to: OperationQueue.current!){ (data, error) in
            if self.change == true{
                if let d = data{
                    
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
                    //print(mag)
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
    
}

