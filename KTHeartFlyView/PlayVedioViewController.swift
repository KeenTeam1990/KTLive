//
//  PlayVedioViewController.swift
//  KTHeartFlyView
//
//  Created by KT on 2017/9/29.
//  Copyright © 2017年 KEENTEAM. All rights reserved.
//

import UIKit

class PlayVedioViewController: UIViewController {

    var live : LiveCell!
    var playerView : UIView!
    var ijkplayer : IJKMediaPlayback!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var fireBtn: UIButton!
    @IBOutlet weak var gifBtn: UIButton!
    @IBOutlet weak var imgBackV: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !self.ijkplayer.isPlaying(){
        ijkplayer.prepareToPlay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        setPlayerView()
        bringBtnTofront()
    
    }

    @IBAction func goBackBtn(_ sender: UIButton) {
        ijkplayer.shutdown()
        navigationController?.setNavigationBarHidden(false, animated: false)
      _ =  navigationController?.popViewController(animated: false)
        
    }
    @IBAction func gitBtn(_ sender: UIButton) {
       
                let duration = 2.0
                let carWidth : CGFloat = 250
                let carHight : CGFloat = 125
        
                //礼物🎁特效
                let car = UIImageView(image: #imageLiteral(resourceName: "porsche"))
                car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                view.addSubview(car)
                UIView.animate(withDuration: duration) {
        
                    car.frame = CGRect(x: self.view.center.x - carWidth/2, y: self.view.center.y - carHight/2 , width: carWidth, height: carHight)
                }
        
                DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
        
                    UIView.animate(withDuration: duration, animations: {
                        car.alpha = 0
                    }, completion: { (completed) in
                        car.removeFromSuperview()
                    })
                    
                }

        
        
    }
    @IBAction func likeBtn(_ sender: UIButton) {
        
        //爱心❤️特效
                let  heart  = KTHeartFlyView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
                heart.center = CGPoint(x: sender.frame.origin.x, y: sender.frame.origin.y)
                view.addSubview(heart)
                heart.animate(in: view)
                //爱心按钮大小
                let btnAnime  =  CAKeyframeAnimation(keyPath: "transform.scale")
                btnAnime.values = [1.0,0.7,0.5,0.3,0.5,0.7,1.0,1.2,1.4,1.2,1.0]
                btnAnime.keyTimes = [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
                btnAnime.duration = 0.2
                sender.layer.add(btnAnime, forKey: "SHOW")
        
    }
    @IBAction func fireBtn(_ sender: UIButton) {
        
        //烟花特效
                let layerFw = CAEmitterLayer()
                view.layer.addSublayer(layerFw)
                emmitParticles(from:CGPoint(x: 0 , y: 607), emitter: layerFw, in: view)
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    layerFw.removeFromSuperlayer()
                }
        
        
    }
    
    func  setBackGround() {
        
       //默认模糊主播头像背景
        let imgUrl = URL(string: live.icon)
        imgBackV.kf_setImage(with: imgUrl)
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = imgBackV.bounds
        imgBackV.addSubview(effectView)
        
    }
    
    func  setPlayerView() {
        
        self.playerView = UIView(frame:view.bounds)
        view.addSubview(self.playerView)
        ijkplayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkplayer.view!
        pv.frame = CGRect(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height + 70.0)
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        playerView.insertSubview(pv, at: 1)
        ijkplayer.scalingMode = .aspectFill
        
    }
    
    func  bringBtnTofront() {
        
        self.view.bringSubview(toFront: backBtn)
        self.view.bringSubview(toFront: gifBtn)
        self.view.bringSubview(toFront: likeBtn)
        self.view.bringSubview(toFront: fireBtn)
        
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
