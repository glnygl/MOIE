//
//  MovieDetailView.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

class MovieDetailView: BaseView {
    
    var movie: Movie?
    
    var actors: [Actor]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(types: [.MovieDetailHeaderTableCell, .MovieDetailCastTableCell])
        }
    }
}

extension MovieDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movie != nil  && actors != nil {
            return 2
        } else if movie != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeue(type: CellType.MovieDetailHeaderTableCell.rawValue, indexPath: indexPath) as! MovieDetailHeaderTableCell
            cell.movie = movie
            return cell
        } else {
            let cell = tableView.dequeue(type: CellType.MovieDetailCastTableCell.rawValue, indexPath: indexPath) as! MovieDetailCastTableCell
            cell.actors = actors
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 250
        }
    }
    
    
}
