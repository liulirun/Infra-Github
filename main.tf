# data "vault_generic_secret" "template" {
#   path = "infra/dev/secrets/template"
# }

resource "terraform_data" "test" {
  provisioner "local-exec" {
    # command = "echo 'Test the state locking functionality:  ${data.vault_generic_secret.template.data["test"]}!'"
    command = "echo 'Test integrate with kobo'"
  }
}
