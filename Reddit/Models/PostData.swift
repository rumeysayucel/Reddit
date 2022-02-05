//
//  PostData.swift
//  Reddit
//
//  Created by Rumeysa Yücel on 5.02.2022.
//

import Foundation

struct Results: Decodable {
    let data: Datas
}

struct Datas: Decodable {
    let children: [Child]
}

struct Child: Decodable, Identifiable {
    let id = UUID()
    let data: Post
}

struct Post: Decodable {
    let url : String?
    let title : String
    let thumbnail : String
}
