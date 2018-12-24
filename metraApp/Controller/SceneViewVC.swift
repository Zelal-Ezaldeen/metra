//
//  SceneViewVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/18/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit
import ARKit
class SceneViewVC: UIViewController, ARSCNViewDelegate {

    // Outlets
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var planeDetected: UILabel!
    
    let configuration = ARWorldTrackingConfiguration()
    var selectedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
       
        self.sceneView.delegate = self
        self.registerGestureRecognizers()
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        self.sceneView.addGestureRecognizer(pinchGestureRecognizer)
       
        
    
    }
    
    func registerGestureRecognizers() {
         let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
         self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        self.addNode()
        self.playBtn.isEnabled = false
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
    }
    
    func addNode() {
        let salahIbrahimScene = SCNScene(named: "art.scnassets/salahIbrahim.scn")
        let salahIbrahimNode = salahIbrahimScene?.rootNode.childNode(withName: "salahIbrahim", recursively: false)
        salahIbrahimNode?.position = SCNVector3(0.5, -0.1, -0.02)
        self.sceneView.scene.rootNode.addChildNode(salahIbrahimNode!)

    }
    
     @objc func handleTap(sender: UITapGestureRecognizer) {
       let sceneViewTappedOn = sender.view as! ARSCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates, types: .existingPlaneUsingExtent)
        if !hitTest.isEmpty {
            print("match")
        } else { // Here we touch the object in the screen
         print("NOO match")

        }
     }
    
    @objc func pinch(sender: UIPinchGestureRecognizer) {
        let sceneView = sender.view as! ARSCNView
        let pinchLocation = sender.location(in: sceneView)
        let hitTest = sceneView.hitTest(pinchLocation)
        if !hitTest.isEmpty {
            let results = hitTest.first!
            let node = results.node
            let pinchAction = SCNAction.scale(by: sender.scale, duration: 0)
            node.runAction(pinchAction)
            sender.scale = 1.0
        }
    }
  
    func onItemSelected(_ itemName: String) {
        selectedItem = itemName
    }
    
    func placeItem(position: SCNVector3) {
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
        DispatchQueue.main.async {
            self.planeDetected.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.planeDetected.isHidden = true
        }
      
        }
    }
}
    
extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
