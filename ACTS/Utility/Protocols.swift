//
//  Protocols.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/28/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

protocol ReportInfectionScreenDelegate {
    func navigateToReportInfectionScreen (isFromFromReportInfection : Bool)
    func navigateToPreviousScreen()
}
protocol ReloadTableViewDelegate {
    func reloadTableView(buttonTag :Int,buttonText: String)
}
