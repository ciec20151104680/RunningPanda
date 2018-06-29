//
//  GameScene.swift
//  RunningPanda
//
//  Created by 20151104680 on 18/6/29.
//  Copyright © 2018年 20151104680. All rights reserved.
//

import SpriteKit

class GameScene: SKScene,SKPhysicsContactDelegate , ProtocolMainscreen{
    lazy var panda  = Panda()
    lazy var platformFactory = PlatformFactory()
    lazy var sound = SoundManager()
    lazy var bg = Background()
    lazy var appleFactory = AppleFactory()
    let scoreLab = SKLabelNode(fontNamed:"Chalkduster")
    let appLab = SKLabelNode(fontNamed:"Chalkduster")
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    var appleNum = 0
    
    
    var moveSpeed :CGFloat = 15.0
    var maxSpeed :CGFloat = 50.0
    var distance:CGFloat = 0.0
    var lastDis:CGFloat = 0.0
    var theY:CGFloat = 0.0
    var isLose = false
    override func didMoveToView(view: SKView) {
        
        let skyColor = SKColor(red:113.0/255.0, green:197.0/255.0, blue:207.0/255.0, alpha:1.0)
        self.backgroundColor = skyColor
        scoreLab.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        scoreLab.position = CGPointMake(20, self.frame.size.height-150)
        scoreLab.text = "run: 0 km"
        self.addChild(scoreLab)
        
        appLab.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        appLab.position = CGPointMake(400, self.frame.size.height-150)
        appLab.text = "eat: \(appleNum) apple"
        self.addChild(appLab)
        
        myLabel.text = "";
        myLabel.fontSize = 65;
        myLabel.zPosition = 100
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(myLabel)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody!.categoryBitMask = BitMaskType.scene
        self.physicsBody!.dynamic = false
        
        panda.position = CGPointMake(200, 400)
        self.addChild(panda)
        self.addChild(platformFactory)
        platformFactory.screenWdith = self.frame.width
        platformFactory.delegate = self
        platformFactory.createPlatform(3, x: 0, y: 200)
        
        self.addChild(bg)
        
        self.addChild(sound)
        sound.playBackgroundMusic()
        
        appleFactory.onInit(self.frame.width, y: theY)
        self.addChild( appleFactory )
        
}
