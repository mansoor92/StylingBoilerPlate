//
//  LoadingBackgroundView.swift
//  Pods
//
//  Created by Incubasys on 26/07/2017.
//
//

import UIKit
//import MRProgress
import SVProgressHUD

public protocol RefreshControlDelegate{
    func refreshData()
}

public class LoadingView: UIView {
    
    private var serviceResponseView : ServiceResponseView?
    public var loadingMessage:String = "Loading..."
    private var loadingIsVisible = false
//    private var mrProgressOverlay : MRProgressOverlayView!
    private var refreshControl : UIRefreshControl?
//    var isShowingS
//    private var pageLoadingView : PageLoadingView!
    
    private var refreshDelegate: RefreshControlDelegate?
    override public func awakeFromNib() {}
    
    public static func show(msg: String = "Loading..."){
        if let window = UIApplication.shared.delegate?.window{
            SVProgressHUD.setContainerView(window)
        }
        SVProgressHUD.show(withStatus: msg)
    }
    
    public static func hide(){
        SVProgressHUD.dismiss()
    }
    
    //Service Response View
    public func addServiceReponseView(delegate:ServiceResponseViewDelegate,top:CGFloat=0,bottom:CGFloat=0)  {
        createServiceResponseView(delegate:delegate,top:top,bottom:bottom)
    }
    
    func createServiceResponseView(delegate:ServiceResponseViewDelegate,top:CGFloat=0,bottom:CGFloat=0) {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height - top - bottom
        serviceResponseView = ServiceResponseView(frame: CGRect(x: 0, y: top, width: w, height: h))
        serviceResponseView?.delegate = delegate
        self.addSubview(serviceResponseView!)
        self.bringSubview(toFront: serviceResponseView!)
        serviceResponseView?.isHidden = true
    }
    
    
    //Refresh control
    func createRefreshControl(controller: UIViewController, title: String) -> UIRefreshControl {
        let rControl = UIRefreshControl()
        rControl.attributedTitle = NSAttributedString(string: title)
        rControl.addTarget(controller, action: Selector(("refreshData")), for: .valueChanged)
        return rControl
    }
    
    public func addRefreshControl(tableView:UITableView,refreshTitle:String,controller:UIViewController, delegate: RefreshControlDelegate)  {
        self.refreshDelegate = delegate
        refreshControl = createRefreshControl(controller: controller, title: refreshTitle)
        tableView.addSubview(refreshControl!)
    }
    
    public func addRefreshControl(collectionView:UICollectionView,refreshTitle:String,controller:UIViewController, delegate: RefreshControlDelegate)  {
        self.refreshDelegate = delegate
        refreshControl = createRefreshControl(controller: controller, title: refreshTitle)
        collectionView.addSubview(refreshControl!)
    }
    /*
    //Page Loading view for pagination
    func addPageLoadingView(top:CGFloat = 44,bottom:CGFloat)  {
        let w = UIScreen.main.bounds.width
        let y = UIScreen.main.bounds.height - top - bottom
        pageLoadingView = PageLoadingView(frame:CGRect(x: 0, y: y, width: w, height: 44))
        pageLoadingView.backgroundColor = UIColor.yellow
        self.addSubview(pageLoadingView)
        
        pageLoadingView.isHidden = true
    }
    
    func showPageLoading(msg:String = "Loading more...")  {
        pageLoadingView.labelMsg.text = msg
        pageLoadingView.isHidden = false
    }
    
    func hidePageLoading()  {
        pageLoadingView.isHidden = true
    }*/
    
    public func hideLoadingOrMessageView()  {
//        if mrProgressOverlay != nil{
//            mrProgressOverlay.hide(true)
//            mrProgressOverlay = nil
//            self.loadingIsVisible = false
//        }else {
//            serviceResponseView?.isHidden = true
//        }
        if loadingIsVisible{
            LoadingView.hide()
            loadingIsVisible = false
        }else{
            serviceResponseView?.isHidden = true
        }
    }
    
    //Show Loading View
//    , mode:MRProgressOverlayViewMode = MRProgressOverlayViewMode.indeterminate
    public func showLoadingView(toView: UIView, msg: String = "Loading...")  {
        var title = ""
        if msg.isEmpty{
            title = loadingMessage
        }else{
            title = msg
        }
        self.loadingIsVisible = true
        LoadingView.show(msg: title)
    }
    
    public func showReponseView(title: String?, msg: String?, img: UIImage?, hideRetryBtn: Bool, retryBtnTitle:String = "TRY AGAIN")  {
        if serviceResponseView != nil{
            serviceResponseView?.showMessage(title: title, msg: msg, image: img, hideRetryButton: hideRetryBtn)
            serviceResponseView?.btnRetry.setTitle(retryBtnTitle, for: .normal)
            serviceResponseView?.isHidden = false
        }
    }

}


