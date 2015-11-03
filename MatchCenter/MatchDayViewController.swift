//
//  ViewController.swift
//  MatchCenter
//
//  Created by Pierluigi Cifani on 02/11/15.
//  Copyright © 2015 UX Academy. All rights reserved.
//

import UIKit

class MatchDayViewController: UITableViewController {

    let dataSource = [match1(), match2(), match3(), match4()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set up automatic cell sizing
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //fix bottom empty cells in UITableView
        tableView.tableFooterView = UIView(frame: CGRectZero);
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current matches"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchDayCell", forIndexPath: indexPath) as! MatchDayCell
        
        cell.configureForMatch(dataSource[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}


class MatchDayCell : UITableViewCell {
    
    @IBOutlet weak var visitorTeamImageView: UIImageView!
    @IBOutlet weak var visitorTeamLabel: UILabel!
    @IBOutlet weak var visitorTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!

    @IBOutlet weak var goalsLabel: UILabel!
    
    func configureForMatch(match : Match) {

        visitorTeamImageView.image = UIImage(named: match.visitorTeam.badgeName)
        homeTeamImageView.image = UIImage(named: match.homeTeam.badgeName)
        
        visitorTeamLabel.text = match.visitorTeam.name
        homeTeamLabel.text = match.homeTeam.name
        
        visitorTeamScoreLabel.text = "\(match.visitorTeamGoals.count)"
        homeTeamScoreLabel.text = "\(match.homeTeamGoals.count)"
        
        goalsLabel.text = goalsToString(match.visitorTeamGoals + match.homeTeamGoals)
    }
}

func goalsToString(goals : [Goal]) -> String {
    let sortedGoals = goals.sort({$0.minute < $1.minute})
    
    var output = ""
    sortedGoals.forEach {
        output = output + "\($0.scorer.name), \($0.minute)', \($0.description). "
    }
    return output
}
