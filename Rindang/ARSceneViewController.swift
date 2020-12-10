//
//  ARSceneViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 18/11/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit
import ARKit
import ImageIO

class ARSceneViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    var brightTemp:CGFloat = 0.5
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
        setUpSceneView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    var lightNodes = [SCNNode]()
    var lightEstimationSwitch = false
    var acquireNode = false
    
    
    var detectedHorizontalPlane = false {
        didSet {
            DispatchQueue.main.async {
                self.instructionLabel.isHidden = self.detectedHorizontalPlane
                self.lightEstimationSwitch = self.detectedHorizontalPlane
                self.nextButton.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = nextButton.frame.height/2
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        UIScreen.main.wantsSoftwareDimming = true
        let brightnessScreen = Float(UIScreen.main.brightness) - 0.4
        let bright = (brightnessScreen)
        print(bright)
        if Float(bright)<0.1 {
            let alert = UIAlertController(title: "Intensitas cahaya kurang", message: "Coba lagi ditempat yang lebih terang", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true){
                self.navigationController?.popViewController(animated: true)
            }
        } else if Float(bright)<0.3 {
            tumbuhan.sharedInstance.listTumbuhanTemp = []
            tumbuhan.sharedInstance.listTumbuhanTemp.append(tumbuhan.sharedInstance.plantStock[0])
            tumbuhan.sharedInstance.plant = tumbuhan.sharedInstance.listTumbuhanTemp
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Search") as! SearchViewController
            navigationController?.pushViewController(vc, animated: true)
        } else if Float(bright)<0.5 {
            tumbuhan.sharedInstance.listTumbuhanTemp = []
            tumbuhan.sharedInstance.listTumbuhanTemp.append(tumbuhan.sharedInstance.plantStock[2])
            tumbuhan.sharedInstance.plant = tumbuhan.sharedInstance.listTumbuhanTemp
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Search") as! SearchViewController
            navigationController?.pushViewController(vc, animated: true)
        } else {
            tumbuhan.sharedInstance.listTumbuhanTemp = []
            tumbuhan.sharedInstance.listTumbuhanTemp.append(tumbuhan.sharedInstance.plantStock[1])
            tumbuhan.sharedInstance.plant = tumbuhan.sharedInstance.listTumbuhanTemp
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Search") as! SearchViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setUpSceneView() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
       // sceneView.pointOfView?.camera?.wantsExposureAdaptation = true
        sceneView.delegate = self
        
    }
    
    func getSphereNode(withPosition position: SCNVector3) -> SCNNode {
        let sphere = SCNSphere(radius: 0.1)
        
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = position
        sphereNode.position.y += Float(sphere.radius)
        
        return sphereNode
    }
    
    func getLightNode() -> SCNNode {
        let light = SCNLight()
        light.type = .omni
        light.intensity = 0
        light.temperature = 0
        
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(0,1,0)
        
        return lightNode
    }
    
    func addLightNodeTo(_ node: SCNNode) {
        let lightNode = getLightNode()
        node.addChildNode(lightNode)
        lightNodes.append(lightNode)
    }
    
    func updateLightNodesLightEstimation() {
        DispatchQueue.main.async {
            guard self.lightEstimationSwitch == true,
                  let lightEstimate = self.sceneView.session.currentFrame?.lightEstimate
            else { return }
            
            let ambientIntensity = lightEstimate.ambientIntensity
            let ambientColorTemperature = lightEstimate.ambientColorTemperature
            
            for lightNode in self.lightNodes {
                guard let light = lightNode.light else { continue }
                light.intensity = ambientIntensity
                
                
                light.temperature = ambientColorTemperature
            }
        }
    }
    
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {

        //Retrieving EXIF data of camara frame buffer
        let rawMetadata = CMCopyDictionaryOfAttachments(allocator: nil, target: sampleBuffer, attachmentMode: CMAttachmentMode(kCMAttachmentMode_ShouldPropagate))
        let metadata = CFDictionaryCreateMutableCopy(nil, 0, rawMetadata) as NSMutableDictionary
        let exifData = metadata.value(forKey: "{Exif}") as? NSMutableDictionary

        let FNumber : Double = exifData?["FNumber"] as! Double
        let ExposureTime : Double = exifData?["ExposureTime"] as! Double
        let ISOSpeedRatingsArray = exifData!["ISOSpeedRatings"] as? NSArray
        let ISOSpeedRatings : Double = ISOSpeedRatingsArray![0] as! Double
        let CalibrationConstant : Double = 50

        //Calculating the luminosity
        let luminosity : Double = (CalibrationConstant * FNumber * FNumber ) / ( ExposureTime * ISOSpeedRatings )

        print("lux: \(luminosity)")
    }
    
    
}

extension ARSceneViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard acquireNode == false else { return }
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let planeAnchorCenter = SCNVector3(planeAnchor.center)
        let sphereNode = getSphereNode(withPosition: planeAnchorCenter)
        addLightNodeTo(sphereNode)
        node.addChildNode(sphereNode)
        detectedHorizontalPlane = true
        acquireNode = true
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        updateLightNodesLightEstimation()
    }
}
