//
//  Villas.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/24/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import Foundation
import SceneKit

class Villa {
    class func getIbrahimVilla() -> SCNNode {
        let salahIbrahimScene = SCNScene(named: "art.scnassets/salahIbrahim.scn")
        let salahIbrahimNode = salahIbrahimScene?.rootNode.childNode(withName: "salahIbrahim", recursively: false)
        salahIbrahimNode?.position = SCNVector3(0.5, -0.1, -0.02)
        return salahIbrahimNode!
    }
    
    class func getAljassas() -> SCNNode {
        let villaAljassasScene = SCNScene(named: "art.scnassets/villaAljassas.scn")
        let villaAljassasNode = villaAljassasScene?.rootNode.childNode(withName: "villaAljassas", recursively: false)
        villaAljassasNode?.scale = SCNVector3Make(0.0058, 0.0058, 0.0058)
            villaAljassasNode?.position = SCNVector3(1, 0, -1)
         return villaAljassasNode!
    }
    
    class func getGroundAthby() -> SCNNode {
        let groundAthbyVillaScene = SCNScene(named: "art.scnassets/groundAthbyVilla.scn")
        let groundAthbyVillaNode = groundAthbyVillaScene?.rootNode.childNode(withName: "groundAthbyVilla", recursively: false)
        groundAthbyVillaNode?.scale = SCNVector3Make(0.0058, 0.0058, 0.0058)
        groundAthbyVillaNode?.position = SCNVector3(-1 , 0, -1)
      return groundAthbyVillaNode!
    }
    
   
}
