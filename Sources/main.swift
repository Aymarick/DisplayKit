
import Foundation

if let application = Application() {
    let window = Window(withTitle: "DisplayKit")
    application.add(window: window)
    let view = View(withFrame: CGRect(x: 20, y:20, width: 200, height: 200))
    view.backgroundColor = .red
    
    let v2 = View(withFrame: CGRect(x: 20, y:20, width: 150, height: 150))
    v2.backgroundColor = .blue
    v2.cornerRadius = 10
    view.addSubview(v2)
    
    let v3 = View(withFrame: CGRect(x: 100, y:100, width: 50, height: 50))
    v3.backgroundColor = .green
    v3.cornerRadius = 25
    v2.addSubview(v3)
    
    window.addSubview(view)
    
    _ = application.start()
}


