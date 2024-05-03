//
//  Community Requests.swift
//  UConnect
//
//  Created by student on 03/05/24.
//

import Foundation

struct communityRequest {
    var communityProfileImageName: String
    var communityName: String
    var requestStatus: String
}

let Request1 = communityRequest(
    communityProfileImageName: "pop_icon",
    communityName: "Pop Dancers",
    requestStatus: "ACCEPTED"
)

let Request2 = communityRequest(
    communityProfileImageName: "hip_icon",
    communityName: "Hip Hoppers",
    requestStatus: "REJECTED"
)

let Request3 = communityRequest(
    communityProfileImageName: "geeky_ants",
    communityName: "Geeky Ants",
    requestStatus: "PENDING"
)

let Request4 = communityRequest(
    communityProfileImageName: "kickin_crew",
    communityName: "Kickin' Crew",
    requestStatus: "PENDING"
)

var communityRequests: [communityRequest] = [
    Request1,
    Request2,
    Request3,
    Request4
]
