
import 'package:json_annotation/json_annotation.dart';

part 'git_api.g.dart';

@JsonSerializable()
class GitApi {

  String? login;
  int? id;
  String? node_id;
  String? avatar_url;
  String? gravatar_id;
  String? url;
  String? html_url;
  String? followers_url;
  String? following_url;
  String? gists_url;
  String? starred_url;
  String? subscriptions_url;
  String? organizations_url;
  String? repos_url;
  String? events_url;
  String? received_events_url;
  String? type;
  bool? site_admin;
  String? name;
  dynamic? company;
  String? blog;
  String? location;
  dynamic? email;
  dynamic? hireable;
  String? bio;
  String? twitter_username;
  int? public_repos;
  int? public_gists;
  int? followers;
  int? following;
  String? created_at;
  String? updated_at;

  GitApi({
       this.login,
       this.id,
       this.node_id,
       this.avatar_url,
       this.gravatar_id,
       this.url,
       this.html_url,
       this.followers_url,
       this.following_url,
       this.gists_url,
       this.starred_url,
       this.subscriptions_url,
       this.organizations_url,
       this.repos_url,
       this.events_url,
       this.received_events_url,
       this.type,
       this.site_admin,
       this.name,
      this.company, 
       this.blog,
       this.location,
      this.email, 
      this.hireable, 
       this.bio,
       this.twitter_username,
       this.public_repos,
       this.public_gists,
       this.followers,
       this.following,
       this.created_at,
       this.updated_at,
  });

  factory GitApi.fromJson(Map<String,dynamic> json) => _$GitApiFromJson(json);

  Map<String, dynamic> toJson() => _$GitApiToJson(this);

}

@JsonSerializable()
class Followers {

  String? login;
  int? id;
  String? node_id;
  String? avatar_url;
  String? gravatar_id;
  String? url;
  String? html_url;
  String? followers_url;
  String? following_url;
  String? gists_url;
  String? starred_url;
  String? subscriptions_url;
  String? organizations_url;
  String? repos_url;
  String? events_url;
  String? received_events_url;
  String? type;
  bool? site_admin;

  Followers({
     this.login,
     this.id,
     this.node_id,
     this.avatar_url,
     this.gravatar_id,
     this.url,
     this.html_url,
     this.followers_url,
     this.following_url,
     this.gists_url,
     this.starred_url,
     this.subscriptions_url,
     this.organizations_url,
     this.repos_url,
     this.events_url,
     this.received_events_url,
     this.type,
     this.site_admin,
  });

  factory Followers.fromJson(Map<String,dynamic> json) => _$FollowersFromJson(json);


  Map<String, dynamic> toJson() => _$FollowersToJson(this);

}

@JsonSerializable()
class Repo {

  int ?id;
  String? node_id;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? html_url;
  String? description;
  bool? fork;
  String? url;
  String? forks_url;
  String? keys_url;
  String? collaborators_url;
  String? teams_url;
  String? hooks_url;
  String? issue_events_url;
  String? events_url;
  String? assignees_url;
  String? branches_url;
  String? tags_url;
  String? blobs_url;
  String? gitTags_url;
  String? gitRefs_url;
  String? trees_url;
  String? statuses_url;
  String? languages_url;
  String? stargazers_url;
  String? contributors_url;
  String? subscribers_url;
  String? subscription_url;
  String? commits_url;
  String? gitCommits_url;
  String? comments_url;
  String? issueComment_url;
  String? contents_url;
  String? compare_url;
  String? merges_url;
  String? archive_url;
  String? downloads_url;
  String? issues_url;
  String? pulls_url;
  String? milestones_url;
  String? notifications_url;
  String? labels_url;
  String? releases_url;
  String? deployments_url;
  String? created_at;
  String? updated_at;
  String? pushedAt;
  String? git_url;
  String? ssh_url;
  String? clone_url;
  String? svn_url;
  String? homepage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  dynamic? language;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasDownloads;
  bool? hasWiki;
  bool? hasPages;
  bool? hasDiscussions;
  int? forksCount;
  dynamic? mirror_url;
  bool? archived;
  bool? disabled;
  int? openIssuesCount;
  License? license;
  bool? allowForking;
  bool? isTemplate;
  bool? webCommitSignoff;
  List<dynamic>? topics;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;
  Permissions? permissions;

  Repo({
     this.id,
     this.node_id,
     this.name,
     this.fullName,
     this.private,
     this.owner,
     this.html_url,
     this.description,
     this.fork,
     this.url,
     this.forks_url,
     this.keys_url,
     this.collaborators_url,
     this.teams_url,
     this.hooks_url,
     this.issue_events_url,
     this.events_url,
     this.assignees_url,
     this.branches_url,
     this.tags_url,
     this.blobs_url,
     this.gitTags_url,
     this.gitRefs_url,
     this.trees_url,
     this.statuses_url,
     this.languages_url,
     this.stargazers_url,
     this.contributors_url,
     this.subscribers_url,
     this.subscription_url,
     this.commits_url,
     this.gitCommits_url,
     this.comments_url,
     this.issueComment_url,
     this.contents_url,
     this.compare_url,
     this.merges_url,
     this.archive_url,
     this.downloads_url,
     this.issues_url,
     this.pulls_url,
     this.milestones_url,
     this.notifications_url,
     this.labels_url,
     this.releases_url,
     this.deployments_url,
     this.created_at,
     this.updated_at,
     this.pushedAt,
     this.git_url,
     this.ssh_url,
     this.clone_url,
     this.svn_url,
     this.homepage,
     this.size,
     this.stargazersCount,
     this.watchersCount,
    this.language,
     this.hasIssues,
     this.hasProjects,
     this.hasDownloads,
     this.hasWiki,
     this.hasPages,
     this.hasDiscussions,
     this.forksCount,
    this.mirror_url,
     this.archived,
     this.disabled,
     this.openIssuesCount,
     this.license,
     this.allowForking,
     this.isTemplate,
     this.webCommitSignoff,
     this.topics,
     this.visibility,
     this.forks,
     this.openIssues,
     this.watchers,
     this.defaultBranch,
     this.permissions,
  });

  factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);


  Map<String, dynamic> toJson() => _$RepoToJson(this);

}

@JsonSerializable()
class Owner {

  String? login;
  int? id;
  String? node_id;
  String? avatar_url;
  String? gravatar_id;
  String? url;
  String? html_url;
  String? followers_url;
  String? following_url;
  String? gists_url;
  String? starred_url;
  String? subscriptions_url;
  String? organizations_url;
  String? repos_url;
  String? events_url;
  String? received_events_url;
  String? type;
  bool? site_admin;

  Owner({
     this.login,
     this.id,
     this.node_id,
     this.avatar_url,
     this.gravatar_id,
     this.url,
     this.html_url,
     this.followers_url,
     this.following_url,
     this.gists_url,
     this.starred_url,
     this.subscriptions_url,
     this.organizations_url,
     this.repos_url,
     this.events_url,
     this.received_events_url,
     this.type,
     this.site_admin,});

  factory Owner.fromJson(Map<String,dynamic> json) => _$OwnerFromJson(json);


  Map<String, dynamic> toJson() => _$OwnerToJson(this);

}

@JsonSerializable()
class License {

  String? key;
  String? name;
  String? spdx_id;
  String? url;
  String? node_id;

  License({
     this.key,
     this.name,
     this.spdx_id,
     this.url,
     this.node_id,
  });

  factory License.fromJson(Map<String,dynamic> json) => _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);

}

@JsonSerializable()
class Permissions {

  bool? admin;
  bool? maintain;
  bool? push;
  bool? triage;
  bool? pull;

  Permissions({
     this.admin,
     this.maintain,
     this.push,
     this.triage,
     this.pull,
  });

  factory Permissions.fromJson(Map<String,dynamic> json) => _$PermissionsFromJson(json);


  Map<String, dynamic> toJson() => _$PermissionsToJson(this);

}