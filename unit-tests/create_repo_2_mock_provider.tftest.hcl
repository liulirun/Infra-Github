// #this is unittest for resource in root folder, do not pass output back, instead, just check the resource

mock_provider "github" {
}

variables {
  visibility = "private"
}

run "create_repo_id" {
  command = apply
  
  assert {
    condition     = github_repository.test_repo1.name == "terraform_test_1"
    error_message = "test_pr_info branch is not main"
  }
  assert {
    condition     = github_repository.test_repo1.visibility == var.visibility
    error_message = "repo terraform_created1 visibility"
  }
  assert {
    condition     = github_repository.test_repo1.allow_squash_merge == false
    error_message = "repo terraform_created1 allow_squash_merge"
  }

}
