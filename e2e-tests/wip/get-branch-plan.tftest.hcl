run "end-to-end-get-branch" {
  command = plan
  plan_options  {
    refresh = false
    target = []
  }
  assert {
    condition     = output.action_branch == "master"
    error_message = "action branch is not master"
  }
}