
import GM
import MBProgressHUD

extension MBProgressHUD {
        
    // MARK: 显示错误信息
    public class func showError(_ msg:String = "", to view:UIView?) {
        self.showCustom(msg, icon: "error.png", to: view)
    }
    
    // MARK: 显示成功信息
    public class func showSuccess(_ msg:String = "", to view:UIView?) {
        self.showCustom(msg, icon: "success.png", to: view)
    }

    // MARK: 显示提示信息
    public class func showTips(_ msg:String = "", to view:UIView?) {
        self.showMessage(msg, to: view)
    }

    // MARK: 显示提示信息
    @discardableResult
    public class func showLoading(_ msg:String = "", to view:UIView?) -> MBProgressHUD {
        let view = view ?? GM.firstKeyWindow!
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.detailsLabel.text = msg
        hud.contentColor = .white
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = .systemFont(ofSize: 16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = UIColor(named: "343A40_FFFFFF")
        hud.mode = .indeterminate
        return hud
    }
    
    // MARK: 显示信息
    private class func showCustom(_ text:String? = nil, icon:String? = nil, to view:UIView? = nil) {
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
            
        hud.margin = 10
        /// 距离顶部80
        hud.offset = CGPoint(x: 0, y: -(UIScreen.main.bounds.height / 2 - 100))
        // 再设置模式
        hud.mode = .customView
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        // 2秒之后再消失
        hud.hide(animated: true, afterDelay: 1.0)
    }
    
    // MARK: 显示一些信息
    public class func showMessage(_ msg:String = "", to view:UIView? = nil){
        let view = view ?? GM.firstKeyWindow!
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.detailsLabel.text = msg
        hud.contentColor = .white
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = .systemFont(ofSize: 16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = UIColor(named: "343A40_FFFFFF")
        hud.mode = .text
        hud.margin = 10
        /// 距离顶部80
        hud.offset = CGPoint(x: 0, y: -(UIScreen.main.bounds.height / 2 - 100))
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1.0)
    }
}


extension GM {
    
    public static func showLoading(msg:String = "", view:UIView? = nil) {
        MBProgressHUD.showLoading(msg, to: view)
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

