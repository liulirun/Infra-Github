
output "output_branch_test" {
  value = data.github_branch.test_pr_info.branch
}

output "output_branch_action" {
  value = data.github_branch.action.branch
}
