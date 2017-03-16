
import Foundation

if let application = Application() {
    let window = Window(withTitle: "DisplayKit")
    application.add(window: window)
    let view = View(withFrame: CGRect(x: 20, y:20, width: 200, height: 200))
    view.backgroundColor = .red
    
    let v2 = View(withFrame: CGRect(x: 20, y:20, width: 160, height: 160))
    v2.backgroundColor = .blue
    v2.cornerRadius = 10
    view.addSubview(v2)
    
    let v3 = View(withFrame: CGRect(x: 20, y:20, width: 120, height: 120))
    v3.backgroundColor = .green
    v3.cornerRadius = 10
    v2.addSubview(v3)
    
    window.addSubview(view)
    
    _ = application.start()
}


