run "end-to-end-get-branch" {
  command = plan
  assert {
    condition     = output.action_branch == "master"
    error_message = "action branch is not master"
  }
}