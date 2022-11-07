//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Test"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

// -------------------------------------
//  Tutorial Content

var myInts: [Int] = [1, 2, 3]
for int in myInts {
    print(int)
}

myInts.append(99)
myInts.append(42)
myInts.sort()
//myInts = []
myInts.isEmpty
myInts.count
myInts[0]
myInts[1]
myInts[2]
//myInts[99] // error

struct LeaderboardEntry {
    let points: Int
    let date: Date
}
var leaderboardEntry: [LeaderboardEntry] = []
leaderboardEntry.append(LeaderboardEntry(points: 99, date: Date()))
leaderboardEntry.append(LeaderboardEntry(points: 42, date: Date()))
leaderboardEntry.sorted { $0.points < $1.points } // Couln't sort #learn
print(leaderboardEntry)
