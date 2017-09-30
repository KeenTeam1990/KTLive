//
//  ViewController.swift
//  KTHeartFlyView
//
//  Created by KT on 2017/9/28.
//  Copyright © 2017年 KEENTEAM. All rights reserved.
//

import UIKit
import Just
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let liveListUrl = "http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"
    var list : [LiveCell] = []
    let refreshControl =  UIRefreshControl()
    var dataArr = NSMutableArray()
    var _tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "KT直播"
        setTableView()
        setDataSource()
        setRefresh()
        
    }
    
    func setDataSource(){
        
       Just.post(liveListUrl) { (r) in
        
        guard (r.json as? NSDictionary) != nil else{
        
           return
        }
        let lives = RootClass.init(fromDictionary:r.json as! [String : Any]).lives!
        self.list = lives.map({ (live) -> LiveCell in
            
            return LiveCell(name:live.creator.nick ,icon:live.creator.portrait,bigImg:live.image,address:live.city,viewersNum:live.onlineUsers,url:live.streamAddr)
            
        })
        OperationQueue.main.addOperation {
            
            self._tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
      }
    }
    
    func  setTableView(){
        
        _tableView = UITableView(frame: self.view.frame, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(_tableView)
        let nibCell = UINib(nibName: "LiveTableViewCell", bundle: nil)
        _tableView.register(nibCell, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LiveTableViewCell
        
        let live = list[indexPath.row]
        cell.nameLbl.text = live.name
        let imgUrl = URL(string: live.icon)
        cell.iconImgView.kf_setImage(with: imgUrl)
        cell.bigImgView.kf_setImage(with: imgUrl)
        cell.addressLbl.text = live.address
        cell.viewersNumLbl.text = "\(live.viewersNum)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        _tableView.deselectRow(at: indexPath, animated: true)
        let playVC = PlayVedioViewController()
        
        playVC.live = list[indexPath.row]
        
        navigationController?.pushViewController(playVC, animated: false)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func  setRefresh(){
    
        refreshControl.addTarget(self, action: #selector(setDataSource), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        _tableView.addSubview(refreshControl)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

