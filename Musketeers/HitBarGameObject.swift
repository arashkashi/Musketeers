//
//  PlayerGameObject.swift
//  Musketeers
//
//  Created by Arash Kashi on 10/12/14.
//  Copyright (c) 2014 Wooga. All rights reserved.
//

import Foundation
import SpriteKit

class HitBarGameObject: GameObject {
    
    var hitBar : SKNode?;
    var arrow : SKNode?;
    var perfectHits = [SKNode]();
    var goodHits = [SKNode]();
    
    var minScores = [ 1, 2, 4 ];
    var hitScores = [ 0, 0, 0 ];
    var currentHit : Int = 0;
    var maxHit : Int = 0;
    
    var bgWidth : CGFloat?;
    var offset : CGFloat?;
    var accelerationRatio : CGFloat = 100;
    
    override init(node: SKNode?) {
        super.init(node: node)
        type = .HitBar
    }
    
    func hit()
    {
        if ( currentHit < maxHit )
        {
            hitScores[ currentHit ] = getHitScore();
            println( hitScores[ currentHit ] );
            currentHit++;
        }
        
        if ( currentHit >= maxHit )
        {
            var total : Int = 0;
            for score in hitScores
            {
                total += score;
            }
            
            if ( total >= minScores[ maxHit - 1 ] )
            {
                println("TRUE: \(total)");
            }
            else
            {
                println("FALSE: \(total)");
            }
            
            start( RandUtil.randRange(1, upper: 3) );
        }
    }
    
    func getHitScore() -> Int
    {
        for var index = 0; index < 3; index++
        {
            var perfectHit = perfectHits[ index ];
            var hitHalf = ( perfectHit.frame.width * perfectHit.xScale ) / 2;
            var hitPosition = perfectHit.position.x + bgWidth!;
            var arrowPosition = arrow!.position.x + bgWidth!;
            
            if ( arrowPosition > hitPosition - hitHalf && arrowPosition < hitPosition + hitHalf )
            {
                return 2;
            }
            
            var goodHit = goodHits[ index ];
            hitHalf = ( goodHit.frame.width * goodHit.xScale ) / 2;
            hitPosition = goodHit.position.x + bgWidth!;
            if ( arrowPosition > hitPosition - hitHalf && arrowPosition < hitPosition + hitHalf )
            {
                return 1;
            }
            
        }
        
        return 0;
    }
    
    func start(numHitArea: Int)
    {
        println("------");
        arrow!.position.x = -offset!;
        currentHit = 0;
        maxHit = numHitArea;
        hitScores[0] = 0;
        hitScores[1] = 0;
        hitScores[2] = 0;
        hideHitAreas();
        
        for var index = 0; index < numHitArea; index++
        {
            var perfectHit = perfectHits[ index ];
            perfectHit.alpha = 1;
            perfectHit.position.x = getHitPosition( index, total: numHitArea ) - offset! / 2;
            
            var goodHit = goodHits[ index ];
            goodHit.alpha = 1;
            goodHit.xScale = CGFloat( RandUtil.randRange(70, upper: 200) ) / 100.0;
            goodHit.position.x = perfectHit.position.x;
        }
    }
    
    func getHitPosition( index: Int, total: Int ) -> CGFloat
    {
        var available : Int = Int( bgWidth! * 0.75 );
        var section = available / total;
        var min = index * section;
        var max = ( index + 1 ) * section;
        return CGFloat( RandUtil.randRange(min, upper: max) );
    }
    
    override func update(dt: Double, allObject: [GameObject]) {
        arrow!.position.x += 1 + ( ( arrow!.position.x + offset! ) / accelerationRatio );
        
        if ( arrow!.position.x > offset )
        {
            arrow!.position.x = -offset!;
        }
    }    
    
    // MARK: Initiation
    func initBar() {
        self.bgWidth = self.node?.frame.width;
        self.offset = bgWidth! / 2;
        
        self.arrow = self.node?.childNodeWithName("Arrow");
        arrow?.position.x = -offset!;
        
        for index in 0...2
        {
            var perfectObject = self.node?.childNodeWithName("PerfectHit"+String(index))
            perfectObject?.alpha = 0;
            perfectHits.append( perfectObject! );
            
            var goodObject = self.node?.childNodeWithName("GoodHit"+String(index))
            goodObject?.alpha = 0;
            goodHits.append( goodObject! );
        }
    }
    
    func hideHitAreas()
    {
        for index in 0...2
        {
            perfectHits[ index ].alpha = 0;
            perfectHits[ index ].position.x = 500;
            goodHits[ index ].alpha = 0;
            goodHits[ index ].position.x = 500;
        }
    }
    
}

