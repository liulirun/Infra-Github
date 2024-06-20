resource "github_repository" "test_repo1" {
  name               = "terraform_test_1"
  description        = "terraform created repo: terraform_test_1"
  visibility         = "private"
  allow_squash_merge = false
  allow_rebase_merge = false
}
