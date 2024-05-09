//
//  topCommunitesOfTechnology.swift
//  UConnect
//
//  Created by student on 08/05/24.
//

import Foundation

struct CommunityItem {
    var image: String
    var name: String
    var memberCount: Int
}

class CommunityDataManager {
    
    static let shared = CommunityDataManager() // Singleton instance
    
    private var communities: [CommunityItem] = []
    
    init() {
        // Define your initial communities here
        communities = [
            CommunityItem(image: "kickin'_crew", name: "Kickin’ Crew", memberCount: 100),
            CommunityItem(image: "theCultOfClassicLiterature", name: "The Cult of Classic Literature", memberCount: 50),
            CommunityItem(image: "NoiceSet", name: "Noice Set", memberCount: 200),
            CommunityItem(image: "FierceMatrix", name: "Fierce Matrix", memberCount: 150),
            CommunityItem(image: "SavageSquad", name: "Savage Squad", memberCount: 250),
            CommunityItem(image: "IconicForce", name: "Iconic Force", memberCount: 300),
            CommunityItem(image: "LegendarySet", name: "Legendary Set", memberCount: 350),
            CommunityItem(image: "BeastlySyndicate", name: "Beastly Syndicate",memberCount: 400),
            CommunityItem(image: "SpifftacularTroop", name: "Spifftacular Troop", memberCount: 450),
            CommunityItem(image: "SmoothPosse", name: "Smooth Posse", memberCount: 500),
            CommunityItem(image: "ChoiceMatrix", name: "Choice Matrix", memberCount: 550),
            CommunityItem(image: "AmpedNullSet", name: "Amped Null Set", memberCount: 600),
            CommunityItem(image: "NotoriousSquad", name: "Notorious Squad", memberCount: 650),
            CommunityItem(image: "Legendary Set pic ", name: "Community 14", memberCount: 700),
            CommunityItem(image: "LegendarySet", name: "Community 15", memberCount: 750),
            CommunityItem(image: "LegendarySet", name: "Community 16", memberCount: 800),
            CommunityItem(image: "LegendarySet", name: "Community 17", memberCount: 850),
            CommunityItem(image: "LegendarySet", name: "Community 18", memberCount: 900),
            CommunityItem(image: "LegendarySet", name: "Community 19", memberCount: 950),
            CommunityItem(image: "LegendarySet", name: "Community 20", memberCount: 1000),
            CommunityItem(image: "LegendarySet", name: "Community 21", memberCount: 1050),
            CommunityItem(image: "LegendarySet", name: "Community 22", memberCount: 1100),
            CommunityItem(image: "LegendarySet", name: "Community 23", memberCount: 1150),
            CommunityItem(image: "LegendarySet", name: "Community 24", memberCount: 1200),
            CommunityItem(image: "LegendarySet", name: "Community 25", memberCount: 1250)
        ]
    }
    
    func getAllCommunities() -> [CommunityItem] {
        return communities
    }
    
    func addCommunity(community: CommunityItem) {
        communities.append(community)
    }
}

var dataModelofCommunities: CommunityDataManager = CommunityDataManager()


