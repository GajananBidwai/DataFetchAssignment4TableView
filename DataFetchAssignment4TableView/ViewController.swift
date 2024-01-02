//
//  ViewController.swift
//  DataFetchAssignment4TableView
//
//  Created by Mac on 21/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    var post : [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchData()
        initializeTableView()
        registerXIBWithTableView()
        
    }
    func fetchData()
    {
        let postUrl = URL(string: "https://jsonplaceholder.typicode.com/comments")
        var postUrlRequest = URLRequest(url: postUrl!)
        
        postUrlRequest.httpMethod = "Get"
        let postUrlSession = URLSession(configuration: .default)
        
        let postDataTask = postUrlSession.dataTask(with: postUrlRequest) { postData, postResponse, postError in
            let postResponse = try! JSONSerialization.jsonObject(with: postData!) as! [[String : Any]]
            
            for eachSession in postResponse
            {
                let postDictionary = eachSession as! [String : Any]
                let postpostId = eachSession ["postId"] as! Int
                let postId = eachSession["id"] as! Int
                let postName = eachSession["name"] as! String
                let postemail = eachSession["email"] as! String
                let postBody = eachSession["body"] as! String
                
                let postObject = Post(postId: postpostId, id: postId, name: postName, email: postemail, body: postBody)
                
                
                self.post.append(postObject)
                
            }
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
            
            
        }
        postDataTask.resume()
        
    }
    func initializeTableView()
    {
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    func registerXIBWithTableView()
    {
        let uinib = UINib(nibName: "PostTableViewCell", bundle: nil)
        postTableView.register(uinib, forCellReuseIdentifier: "PostTableViewCell")
    }
}
extension ViewController : UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200.5
    }
}
extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postTableViewCell = self.postTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        postTableViewCell.postIdLabel.text = String(post[indexPath.row].postId)
        postTableViewCell.idLabel.text = String(post[indexPath.row].id)
        postTableViewCell.nameLabel.text = post[indexPath.row].name
        postTableViewCell.emailLabel.text = post[indexPath.row].email
        postTableViewCell.bodyLabel.text = post[indexPath.row].body
        
        return postTableViewCell
    }
}


