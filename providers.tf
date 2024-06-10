# provider "vault" {
#   address = var.VAULT_HOST_ADDRESS
#   auth_login {
#     path = "auth/approle/login"

#     parameters = {
#       role_id   = var.VAULT_ROLE_ID
#       secret_id = var.VAULT_SECRET_ID
#     }
#   }
# }

# data "vault_generic_secret" "github" {
#   path = "infra/prod/secrets/github"
# }

# Configure the GitHub Provider
provider "github" {
  token          = data.vault_generic_secret.github.data["github_cloud_token"]
  owner          = "liulirun"
  max_retries    = 1
  write_delay_ms = 3000
}
