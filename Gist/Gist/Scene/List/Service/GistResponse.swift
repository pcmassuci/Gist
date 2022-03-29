//
//  GistResponse.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//

import Foundation

struct GistResponse: Decodable {
  struct File: Decodable {
    let type: String?
    let language: String?
    let rawUrl: String?
    let size: Int?
    
    private enum CodingKeys: String, CodingKey {
      case type
      case language
      case rawUrl = "raw_url"
      case size
    }
  }
  
  struct Owner: Decodable {
    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarUrl: String?
    let gravatarId: String?
    let url: String?
    let htmlUrl: String?
    let followersUrl: String?
    let followingUrl: String?
    let gistsUrl: String?
    let starredUrl: String?
    let subscriptionsUrl: String?
    let organizationsUrl: String?
    let reposUrl: String?
    let eventsUrl: String?
    let receivedEventsUrl: String?
    let type: String?
    let siteAdmin: Bool?

    private enum CodingKeys: String, CodingKey {
      case login
      case id
      case nodeId = "node_id"
      case avatarUrl = "avatar_url"
      case gravatarId = "gravatar_id"
      case url
      case htmlUrl = "html_url"
      case followersUrl = "followers_url"
      case followingUrl = "following_url"
      case gistsUrl = "gists_url"
      case starredUrl = "starred_url"
      case subscriptionsUrl = "subscriptions_url"
      case organizationsUrl = "organizations_url"
      case reposUrl = "repos_url"
      case eventsUrl = "events_url"
      case receivedEventsUrl = "received_events_url"
      case type
      case siteAdmin = "site_admin"
    }
  }
  
  let url: String?
  let forksUrl: String?
  let commitsUrl: String?
  let id: String?
  let nodeId: String?
  let gitPullUrl: String?
  let gitPushUrl: String?
  let htmlUrl: String?
  let files: [String: File]?
  let `public`: Bool?
  let createdAt: String?
  let updatedAt: String?
  let description: String?
  let comments: Int?
  let user: String?
  let commentsUrl: String?
  let owner: Owner?
  let truncated: Bool?
  
  private enum CodingKeys: String, CodingKey {
    case url
    case forksUrl = "forks_url"
    case commitsUrl = "commits_url"
    case id
    case nodeId = "node_id"
    case gitPullUrl = "git_pull_url"
    case gitPushUrl = "git_push_url"
    case htmlUrl = "html_url"
    case files
    case `public`
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case description
    case comments
    case user
    case commentsUrl = "comments_url"
    case owner
    case truncated
  }
}






//{
//"url": "https://api.github.com/gists/06115e4df44bfd63fc1ab3f237692cc2",
//"forks_url": "https://api.github.com/gists/06115e4df44bfd63fc1ab3f237692cc2/forks",
//"commits_url": "https://api.github.com/gists/06115e4df44bfd63fc1ab3f237692cc2/commits",
//"id": "06115e4df44bfd63fc1ab3f237692cc2",
//"node_id": "G_kwDOAF-wA9oAIDA2MTE1ZTRkZjQ0YmZkNjNmYzFhYjNmMjM3NjkyY2My",
//"git_pull_url": "https://gist.github.com/06115e4df44bfd63fc1ab3f237692cc2.git",
//"git_push_url": "https://gist.github.com/06115e4df44bfd63fc1ab3f237692cc2.git",
//"html_url": "https://gist.github.com/06115e4df44bfd63fc1ab3f237692cc2",
//"files": {
//  "FilesSnapshot.xml": {
//    "filename": "FilesSnapshot.xml",
//    "type": "application/xml",
//    "language": "XML",
//    "raw_url": "https://gist.githubusercontent.com/choco-bot/06115e4df44bfd63fc1ab3f237692cc2/raw/c474c4e436eeba0cdc748531f972ca7992a99b52/FilesSnapshot.xml",
//    "size": 4440
//  },
//  "Install.txt": {
//    "filename": "Install.txt",
//    "type": "text/plain",
//    "language": "Text",
//    "raw_url": "https://gist.githubusercontent.com/choco-bot/06115e4df44bfd63fc1ab3f237692cc2/raw/615a5a8fb57146af0a5606ef5b843542fa9b3369/Install.txt",
//    "size": 44489
//  },
//  "Uninstall.txt": {
//    "filename": "Uninstall.txt",
//    "type": "text/plain",
//    "language": "Text",
//    "raw_url": "https://gist.githubusercontent.com/choco-bot/06115e4df44bfd63fc1ab3f237692cc2/raw/df40dc6f4e9eada26e8658e980fa4af1330ab036/Uninstall.txt",
//    "size": 35097
//  },
//  "_Summary.md": {
//    "filename": "_Summary.md",
//    "type": "text/markdown",
//    "language": "Markdown",
//    "raw_url": "https://gist.githubusercontent.com/choco-bot/06115e4df44bfd63fc1ab3f237692cc2/raw/3409405f8441f575bc7f0698e72d4ed4411542fd/_Summary.md",
//    "size": 475
//  }
//},

//"owner": {
//  "login": "choco-bot",
//  "id": 6270979,
//  "node_id": "MDQ6VXNlcjYyNzA5Nzk=",
//  "avatar_url": "https://avatars.githubusercontent.com/u/6270979?v=4",
//  "gravatar_id": "",
//  "url": "https://api.github.com/users/choco-bot",
//  "html_url": "https://github.com/choco-bot",
//  "followers_url": "https://api.github.com/users/choco-bot/followers",
//  "following_url": "https://api.github.com/users/choco-bot/following{/other_user}",
//  "gists_url": "https://api.github.com/users/choco-bot/gists{/gist_id}",
//  "starred_url": "https://api.github.com/users/choco-bot/starred{/owner}{/repo}",
//  "subscriptions_url": "https://api.github.com/users/choco-bot/subscriptions",
//  "organizations_url": "https://api.github.com/users/choco-bot/orgs",
//  "repos_url": "https://api.github.com/users/choco-bot/repos",
//  "events_url": "https://api.github.com/users/choco-bot/events{/privacy}",
//  "received_events_url": "https://api.github.com/users/choco-bot/received_events",
//  "type": "User",
//  "site_admin": false
//},
//"truncated": false
//},
