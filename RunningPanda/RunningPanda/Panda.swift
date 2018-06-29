//
//  Panda.swift
//  RunningPanda
//
//  Created by 20151104680 on 18/6/29.
//  Copyright © 2018年 20151104680. All rights reserved.
//

import SpriteKit
enum Status :Int{
    case run = 1, jump, jump2,roll
}

class Panda:SKSpriteNode {
    //定义跑，跳，滚动等动作动画
    let runAtlas = SKTextureAtlas(named: "run.atlas")
    var runFrames = [SKTexture]()
    let jumpAtlas = SKTextureAtlas(named: "jump.atlas")
    var jumpFrames = [SKTexture]()
    let rollAtlas = SKTextureAtlas(named: "roll.atlas")
    var rollFrames = [SKTexture]()
    //增加跳起的逼真效果动画
    let jumpEffectAtlas = SKTextureAtlas(named: "jump_effect.atlas")
    var jumpEffectFrames = [SKTexture]()
    var jumpEffect = SKSpriteNode()
    
    var status = Status.run
    var jumpStart:CGFloat = 0.0
    var jumpEnd:CGFloat = 0.0
    
    
    init(){
        
        let texture = runAtlas.textureNamed("panda_run_01")
        let size = texture.size()
        super.init(texture: texture, color: SKColor.whiteColor(), size: size)
