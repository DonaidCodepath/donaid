//
//  EventCell.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var agencyTitle: UILabel!
    @IBOutlet weak var projectSummary: UILabel!
    @IBOutlet weak var emergencyTypeLabel: UILabel!
    @IBOutlet weak var beneficiariesCount: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    var project: HDXProject! {
        didSet {
            agencyTitle.text = project.agencyName
            projectSummary.text = project.issueTitle
            emergencyTypeLabel.text = project.emergencyType
            beneficiariesCount.text = formatBeneficiariesCount(beneficiaries: project.beneficiaries)
            countryImage.image = #imageLiteral(resourceName: "syria")
            countryLabel.text = (project.country! + ",")
            regionLabel.text = project.region
        }
    }
    
    func formatBeneficiariesCount(beneficiaries: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: beneficiaries))!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
