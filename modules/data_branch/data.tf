

data "github_branch" "test_pr_info" {
  repository = "test_pr_info"
  branch     = "main"
}

data "github_branch" "action" {
  repository = "action"
  branch     = "master"
}
