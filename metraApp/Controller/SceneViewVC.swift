//
//  SceneViewVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/18/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit
import ARKit
class SceneViewVC: UIViewController {

    // Outlets
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var sceneView: ARSCNView!
    
  let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
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
        let villaAljassasScene = SCNScene(named: "art.scnassets/villaAljassas.scn")
        let villaAljassasNode = villaAljassasScene?.rootNode.childNode(withName: "villaAljassas", recursively: false)
        villaAljassasNode?.position = SCNVector3(0, 0, -1)
        self.sceneView.scene.rootNode.addChildNode(villaAljassasNode!)

    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        if hitTest.isEmpty {
            print("didn't touch anything")
        } else { // Here we touch the object in the screen
//            let results = hitTest.first!
//            let node = results.node
//            if node.animationKeys.isEmpty {
//                self.animatNode(node: node)
            }
        }
    }
    
    // To add animate to the object
    /*
    func animatNode(node: SCNNode) {
        let spin = CABasicAnimation(keyPath: "position")
        spin.fromValue = node.presentation.position
        spin.toValue = SCNVector3(node.presentation.position.x - 0.5, node.presentation.position.y - 0.5, node.presentation.position.z - 0.5)
        spin.duration = 2
        spin.autoreverses = true
        spin.repeatCount = 5
        node.addAnimation(spin, forKey: "position")
    }
}*/
