//
//  ViewController.swift
//  APIConnectApp
//
//  Created by Muazzez Aydın on 19.08.2023.
//

import UIKit

class ViewController: UIViewController {

    
   
    
    @IBOutlet weak var tableView: UITableView!
    var postData: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        WebService.shared.getPostData(with: "https://jsonplaceholder.typicode.com/posts") { [self] result in
                    switch result {
                    case .success(let posts):
                        for post in posts {
                            print("Post ID:", post.id ?? "N/A")
                            print("User ID:", post.userID ?? "N/A")
                            print("Title:", post.title ?? "N/A")
                                print("Body:", post.body ?? "N/A")
                                print("------------")
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                self.postData = posts
                            }
                            
                            
                    }
                    case .failure(let error):
                        print("Error:", error)
                    }
            }
        
        
        
        
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.title.text = postData[indexPath.row].title
        cell.body.text = postData[indexPath.row].body
        cell.user.text = "user id: \(String(describing: postData[indexPath.row].userID!))"
        
        return cell
    }
}
