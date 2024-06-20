provider "github" {
  token          = var.gh_key
  owner          = "liulirun"
  max_retries    = 1
  write_delay_ms = 3000
}
