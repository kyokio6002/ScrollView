//
//  ViewController.swift
//  ScrollView
//
//  Created by 塩澤響 on 2020/03/10.
//  Copyright © 2020 塩澤響. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //表示
        configureSV()
        //ボタンを設置
        setButtons()
        
        //バウンスしないようにする
        scrollView.bounces = false
        
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setButtons(){
        //設置するボタンの数
        let NumOfButtons = 4
        //横幅をスクリーンの幅の設置するボタンの数分の1にする
        let buttonWidth = UIScreen.main.bounds.width / CGFloat(NumOfButtons)
        
        for i in 0..<NumOfButtons{
            //インスタンス化
            let Button = UIButton()
            //ボタンの背景色を設定
            Button.backgroundColor = .white
            //ボタンの枠線の色と太さ
            Button.layer.borderColor = UIColor.black.cgColor
            Button.layer.borderWidth = 0.5
            //ボタンの丸枠のカーブの強さ
            Button.layer.cornerRadius = 5.0
            //ボタンのフレーム
            Button.frame = CGRect(x: buttonWidth*CGFloat(i), y: 50, width: buttonWidth, height: 70)
            //タグをつける
            Button.tag = i
            //タイトルとタイトルの文字色
            Button.setTitle("Button\(i)", for: .normal)
            Button.setTitleColor(.black, for: .normal)
            
            //ボタンを押した時(touchUpInside)の処理
            Button.addTarget(self, action: #selector(ButtonTapped(sender:)), for: .touchUpInside)
            //Button.addTarget(self, action: #selector(), for: .touchDown)
            
            //viewにボタンを追加
            self.view.addSubview(Button)
        }
    }
    
    @objc func ButtonTapped(sender:UIButton){
        //押されたボタンの取得
        let BtnSelected = sender.tag
        
        //switchだと綺麗だね
        switch BtnSelected {
        case 0:
            scrollView.contentOffset = CGPoint(x: scrollView.frame.width*CGFloat(BtnSelected), y: 0)
        case 1:
            scrollView.contentOffset = CGPoint(x: scrollView.frame.width*CGFloat(BtnSelected), y: 0)
        case 2:
            scrollView.contentOffset = CGPoint(x: scrollView.frame.width*CGFloat(BtnSelected), y: 0)
        case 3:
            scrollView.contentOffset = CGPoint(x: scrollView.frame.width*CGFloat(BtnSelected), y: 0)
        default:
            print("error")
        }
    }
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////


    //ラベルを作る関数
    func createLabel(contentsView:UIView)->UILabel{
        //インスタンス化
        let label = UILabel()
        
        //labelの座標
        let labelX = CGFloat(0)
        let labelY = contentsView.center.y
        
        label.frame = CGRect(x: labelX, y: labelY, width: contentsView.frame.width, height: 50)
        //文字サイズ
        label.font = label.font.withSize(10)
        
        //label.textに入れる文字列を宣言
        var text:String = ""
        
        //108あたりで幅がちょうどいいからそれまでループ
        for i in 0..<109{
            //文字列に追加
            text.append("\(i) ")
        }
        //label.textに代入
        label.text = text
        return label
    }

    func createContentsView()->UIView{
        let contentsView = UIView()
        //背景が白いと分かりづらいから変更
        contentsView.backgroundColor = .red
        
        //frameを決める(よこはScreenの5倍,縦はScreenと同じ)
        contentsView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*4, height: UIScreen.main.bounds.height)
        
        //labelをcreateLabelで作ってcontentsViewに貼り付け
        let label = createLabel(contentsView: contentsView)
        contentsView.addSubview(label)
        return contentsView
    }
    
    func configureSV(){
        // scrollViewにcontentsViewを配置させる
        let subView = createContentsView()
        scrollView.addSubview(subView)
        
        // scrollViewにcontentsViewのサイズを教える(これが重要)
        scrollView.contentSize = subView.frame.size
    }
    
}

//////////////////////////////////////////////////////////
/*
 参考文献
 
 scrollView
 https://qiita.com/ynakaDream/items/960899183c38949c2ab0
 
 UIBottunをコードで書く際のselecter,@objcの説明
 https://swift-ios.keicode.com/ios/target-action.php
 
*/
//////////////////////////////////////////////////////////

