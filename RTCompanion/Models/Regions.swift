//
//  Regions.swift
//  RTCompanion
//
//  Created by Christian Diaz on 7/27/22.
//

import UIKit

struct Regions {
    
    let regionIcons : [UIImage?] = [
        Icons.bandleCity,
        Icons.bilgeWater,
        Icons.demacia,
        Icons.freljord,
        Icons.ionia,
        Icons.noxus,
        Icons.pAndZ,
        Icons.sI,
        Icons.shurima,
        Icons.targon,
        Icons.runeterra
    ]
    
    let regionLookUp : [String:UIImage?] = [
        RegionNames.bandleCity : Icons.bandleCity,
        RegionNames.bilgeWater : Icons.bilgeWater,
        RegionNames.demacia : Icons.demacia,
        RegionNames.freljord : Icons.freljord,
        RegionNames.ionia : Icons.ionia,
        RegionNames.noxus : Icons.noxus,
        RegionNames.pAndZ : Icons.pAndZ,
        RegionNames.sI : Icons.sI,
        RegionNames.shurima : Icons.shurima,
        RegionNames.targon : Icons.targon,
        RegionNames.runeterra : Icons.runeterra
    ]
}



