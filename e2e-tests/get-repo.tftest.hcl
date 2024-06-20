run "get-action-repo-visibility" {
  command = plan
  assert {
    condition     = output.output_repo_action_visibility == "public"
    error_message = "action branch is not master"
  }
}