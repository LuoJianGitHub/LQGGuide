//
//  LQGGuideController.swift
//  LQGGuide
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import LQGBaseView

/// 引导控制器
public class LQGGuideController: LQGBaseViewController {
    
    //MARK: - StatusBar
    
    override public func lqg_prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: - 属性
    
    lazy var confirmBtn: UIButton = {
        let btn: UIButton = .init()
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 4
        btn.setTitle("跳过引导", for: .normal)
        return btn
    }()
    
    //MARK: - 初始化
    
    override public func lqg_addSubviews() {
        self.view.addSubview(self.confirmBtn)
        self.confirmBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.center.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    //MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.confirmBtn.rx.tap.subscribe {
            UserDefaults.standard.set(true, forKey: "showedGuideVC")
        } onDisposed: {}
    }
    
}
