//
//  ViewController.swift
//  landscape arkit
//
//  Created by Prateek Jadhwani on 11/4/17.
//  Copyright © 2017 Prateek Jadhwani. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    var isInitialized = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [
            ARSCNDebugOptions.showFeaturePoints,
            ARSCNDebugOptions.showWorldOrigin
        ]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        self.configuration.planeDetection = .horizontal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getScnNodeTree(name: String, nodeLocation: SCNVector3) {
        let modelScene = SCNScene(named: "art.scnassets/trees_pack_01.scn")
        let nodeModel = modelScene?.rootNode.childNode(withName: name, recursively: true)
        nodeModel?.position = nodeLocation
        nodeModel?.scale = SCNVector3(0.07, 0.07, 0.07)
        self.sceneView.scene.rootNode.addChildNode(nodeModel!)
        
    }
    
    func getScnNodeBarn(nodeLocation: SCNVector3) {
        let modelScene = SCNScene(named: "art.scnassets/RuralStall.scn")
        let nodeModel = modelScene?.rootNode.childNode(withName: "Dummy001", recursively: true)
        nodeModel?.position = nodeLocation
        nodeModel?.scale = SCNVector3(0.001, 0.001, 0.001)
        self.sceneView.scene.rootNode.addChildNode(nodeModel!)
        
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if self.isInitialized {
            return
        }
        
        let houseLocation = SCNVector3(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
        getScnNodeBarn(nodeLocation: houseLocation)
        
        let tree1Location = SCNVector3(anchor.transform.columns.3.x + 0.2, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
        getScnNodeTree(name: "tree_01", nodeLocation: tree1Location)
        
        let tree2Location = SCNVector3(anchor.transform.columns.3.x + 0.1, anchor.transform.columns.3.y, anchor.transform.columns.3.z + 0.2)
        getScnNodeTree(name: "tree_02", nodeLocation: tree2Location)
        
        let tree3Location = SCNVector3(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z + 0.2)
        getScnNodeTree(name: "tree_03", nodeLocation: tree3Location)
        
        let stamp1Location = SCNVector3(anchor.transform.columns.3.x - 0.1, anchor.transform.columns.3.y, anchor.transform.columns.3.z + 0.25)
        getScnNodeTree(name: "stamp", nodeLocation: stamp1Location)
        
        let stamp2Location = SCNVector3(anchor.transform.columns.3.x + 0.15, anchor.transform.columns.3.y, anchor.transform.columns.3.z + 0.15)
        getScnNodeTree(name: "stamp", nodeLocation: stamp2Location)
        
        let log1Location = SCNVector3(anchor.transform.columns.3.x - 0.2, anchor.transform.columns.3.y, anchor.transform.columns.3.z - 0.25)
        getScnNodeTree(name: "log_01", nodeLocation: log1Location)
        
        let log2Location = SCNVector3(anchor.transform.columns.3.x - 0.2, anchor.transform.columns.3.y, anchor.transform.columns.3.z - 0.2)
        getScnNodeTree(name: "log_01", nodeLocation: log2Location)
        
        let log3Location = SCNVector3(anchor.transform.columns.3.x - 0.2, anchor.transform.columns.3.y, anchor.transform.columns.3.z - 0.15)
        getScnNodeTree(name: "log_01", nodeLocation: log3Location)
        
        self.isInitialized = true
    }
}

