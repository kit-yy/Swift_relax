//
//  ViewController.swift
//  SwiftRelax
//
//  Created by Yasuaki K on 2017/02/21.
//  Copyright © 2017年 Yasuaki Kitaoka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var animationGifView: UIWebView!
    
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var menuView: UIView!
    
    var p1 = AVAudioPlayer()
    var p2 = AVAudioPlayer()
    var p3 = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gifData = NSData(contentsOfFile: Bundle.main.path(forResource:"am", ofType:"gif")!)!
        
        animationGifView.load(gifData as Data, mimeType: "image/gif", textEncodingName: "utf-8", baseURL: NSURL() as URL)
        
        
        startAnimation()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
    }

    func startAnimation(){
        
        UIView.animate(withDuration: 0.5, animations: {()->Void in
            
            //x123
            
            self.b1.frame = CGRect(x: 123, y: 37, width: 128, height: 128)
            
            //y 269
            self.b2.frame = CGRect(x: 123, y: 269, width: 129, height: 128)
            
            
            //y 503
            self.b3.frame = CGRect(x: 123, y: 503, width: 129, height: 128)
            
            
            
        }, completion: {(Bool) -> Void in
            
            
            
        })
        
    }
    
    
    
    
    
    final func didSwipe(sender: UISwipeGestureRecognizer){
        if(sender.direction == .right){
            
            UIView.animate(withDuration: 0.1, animations: {() -> Void in
                
                self.menuView.frame = CGRect(x: 377, y: 0, width: 264, height: 667)
                
            }, completion: {(Bool) -> Void in
            
                
            })
            
        }else if(sender.direction == .left){
            
            UIView.animate(withDuration: 0.1, animations: {() -> Void in
                
                self.menuView.frame = CGRect(x: 151, y: 0, width: 264, height: 667)
                
            }, completion: {(Bool) -> Void in
                
                
            })
            
        }
    }
    @IBAction func Play1(_ sender: Any) {
        
        do {
            p1 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "winds", ofType: "mp3")!))
            p1.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch{
                print(error)
            }
        }catch{
            print(error)
        }
        
    }
        
        
    @IBAction func Play2(_ sender: Any) {
        
        do {
            p2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sea", ofType: "mp3")!))
            p2.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch{
                print(error)
            }
        }catch{
            print(error)
        }
    }
    @IBAction func Play3(_ sender: Any) {
        
        do {
            p3 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "rain", ofType: "mp3")!))
            p3.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch{
                print(error)
            }
        }catch{
            print(error)
        }
    }
    @IBAction func stop1(_ sender: Any) {
        
        p1.stop()
        
    }
    @IBAction func stop2(_ sender: Any) {
        p2.stop()
    }
    @IBAction func stop3(_ sender: Any) {
        p3.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

