import UIKit

extension UITableViewCell {
    var superTableView: UITableView? {
        var view = superview
        while view != nil && !(view is UITableView) {
            view = view?.superview
        }
        return view as? UITableView
    }
}
