//
//  SecondViewController.swift
//  Open
//
//  Created by ramirez herbert on 2/16/18.
//  Copyright © 2018 ramirez herbert. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class SecondViewController: UIViewController {
  
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
    }
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
        
    }
    @IBAction func addCube(_ sender: Any) {
        _ = randomFloat(min: -2, max: -0.2)
        let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        cubeNode.position = SCNVector3(cc.x, cc.y, cc.z)
        //cubeNode.position = SCNVector3(0, 0, cZ)
        
        sceneView.scene.rootNode.addChildNode(cubeNode)

    }
  
    @IBAction func addGarment(_ sender: Any) {
        let garmentNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        garmentNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "garment.scn", inDirectory: "Models.scnassets/garment") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        garmentNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(garmentNode)
    }
    
    @IBAction func addObject(_ sender: Any) {
        let objectNode = SCNNode()
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        objectNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let virtualObjectScene = SCNScene(named: "kungfuharry.scn", inDirectory: "Models.scnassets/harry") else {
            return
        }
        
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        objectNode.addChildNode(wrapperNode)
        
        sceneView.scene.rootNode.addChildNode(objectNode)
        
    }
    
    
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCoordinates(sceneView: ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        
        return cc
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
