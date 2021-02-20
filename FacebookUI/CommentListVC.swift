//
//  CommentListVC.swift
//  FacebookUI
//
//  Created by Rohit Saini on 20/02/21.
//

import UIKit

class CommentListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var commentsList:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()

        // Do any additional setup after loading the view.
    }
    
    private func configUI(){
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
    

}

//MARK: - TableView DataSource and Delegate Methods
extension CommentListVC: UITableViewDelegate, UITableViewDataSource {
    
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
        
        return commentsList.count
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as? CommentCell
        else {
            return UITableViewCell()
        }
        if commentsList.count <= 0{
            return UITableViewCell()
        }
        cell.commentLbl.text = commentsList[indexPath.row]
        return cell
    }
    
}

