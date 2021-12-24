import MBProgressHUD

extension MBProgressHUD {
    
    // MARK: 显示信息
    private class func show(_ text:String? = nil, icon:String? = nil, view:UIView? = nil) {
        let view = view ?? GM.firstKeyWindow!
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.detailsLabel.text = text
        hud.contentColor = .white
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = .systemFont(ofSize: 16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = UIColor(named: "343A40_FFFFFF")
        // 设置图片
        if let icon = icon {
            hud.customView = UIImageView(image: UIImage(named: "Toast.bundle/\(icon)"))
        }
        // 再设置模式
        hud.mode = .customView
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        // 2秒之后再消失
        hud.hide(animated: true, afterDelay: 2.0)
    }
    
    // MARK: 显示错误信息
    public class func showError(_ msg:String = "", to view:UIView?) {
        self.show(msg, icon: "error.png", view: view)
    }
    
    // MARK: 显示成功信息
    public class func showSuccess(_ msg:String = "", to view:UIView?) {
        self.show(msg, icon: "success.png", view: view)
    }

    // MARK: 显示提示信息
    public class func showTips(_ msg:String = "", to view:UIView?) {
        self.show(msg, view: view)
    }

    // MARK: 显示一些信息
    @discardableResult
    public class func showMessage(_ msg:String = "", to view:UIView? = nil, hiddenDelay:TimeInterval? = nil) -> MBProgressHUD {
        let view = view ?? GM.firstKeyWindow!
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.detailsLabel.text = msg
        hud.contentColor = .white
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = .systemFont(ofSize: 16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = UIColor(named: "343A40_FFFFFF")
        hud.mode = .text
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        if let hiddenDelay = hiddenDelay {
            hud.hide(animated: true, afterDelay: hiddenDelay)
        }
        return hud
    }
}


extension GM {
    
    public static func showLoading(msg:String = "", view:UIView? = nil) {
        MBProgressHUD.showMessage(msg, to: view)
    }
    
    public static func hideLoading(view:UIView? = nil) {
        MBProgressHUD.hide(for: view ??  GM.firstKeyWindow!, animated: true)
    }

    public static func showSuccess(msg:String = "", view:UIView? = nil) {
        MBProgressHUD.showSuccess(msg, to: view)
    }
    
    public static func showError(msg:String = "", view:UIView? = nil) {
        MBProgressHUD.showError(msg, to: view)
    }
    
    public static func showMessage(msg:String = "", view:UIView? = nil) {
        MBProgressHUD.showTips(msg, to: view)
    }
}

extension GM {
    public static var firstKeyWindow: UIWindow? {
        UIApplication.shared.getFirstKeyWindow
    }
}

