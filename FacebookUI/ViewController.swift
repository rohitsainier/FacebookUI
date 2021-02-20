//
//  ViewController.swift
//  FacebookUI
//
//  Created by Rohit Saini on 20/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var postVM: PostViewModel = PostViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }

    private func configUI(){
        postVM.delegate = self
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        postVM.getPosts()
    }
}


//MARK: - TableView DataSource and Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postVM.posts.count
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
        else {
            return UITableViewCell()
        }
        if postVM.posts.count <= 0{
            return UITableViewCell()
        }
        cell.postTitleLbl.text = postVM.posts[indexPath.row].post
        cell.commentsCountLbl.setTitle("\(postVM.posts[indexPath.row].comments.count) comments", for: .normal)
        return cell
    }
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: CommentListVC = Storyboard.Main.load.instantiateViewController(withIdentifier: "CommentListVC") as! CommentListVC
        vc.commentsList = postVM.posts[indexPath.row].comments
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: PostDelegate{
    func didRecievedPosts() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else {return}
            self.tableView.reloadData()
        }
    }
    func didReceivedErrorInPosts() {
        //we can show alert or any toast for that
        print("ERROR in fetching data")
    }
}

