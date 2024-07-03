# # use create repo directly

# ## get branch
# module "get_branch_module" {
#   source = "./modules/data_branch"
# }

# module "create_repo_module" {
#   source = "./modules/resource_repo"
# }

# module "get_repo_module" {
#   source = "./modules/data_repo"
# }

# output "action_branch" {
#   value = module.get_branch_module.output_branch_action
# }

# # # create_repo
# # resource "github_repository" "test_repo1" {
# #   name               = "terraform_test_1"
# #   description        = "terraform created repo: terraform_test_1"
# #   visibility         = "private"
# #   allow_squash_merge = false
# #   allow_rebase_merge = false
# # }


# output "output_repo_action_visibility" {
#   value = module.get_repo_module.output_repo_action_visibility
# }

data "http" "example" {
  url = "https://api.github.com/repos/liulirun/action1"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

output "http_status_code" {
  value = data.http.example.status_code
}
