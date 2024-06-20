
run "create_repo_id" {
  command = plan
  assert {
    condition     = github_repository.test_repo1.name == "terraform_test_1"
    error_message = "create repo terraform_created1"
  }
  assert {
    condition     = github_repository.test_repo1.visibility == "private"
    error_message = "repo terraform_created1 visibility"
  }
  assert {
    condition     = github_repository.test_repo1.allow_squash_merge == false
    error_message = "repo terraform_created1 allow_squash_merge"
  }
}