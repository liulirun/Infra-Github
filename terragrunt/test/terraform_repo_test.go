package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


func TestTerraformCreateRepo(t *testing.T) {
	t.Parallel()

	expectedBranchName := "master"
	expectedRepoVisibility := "public"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::1::Set the path to the Terraform code that will be tested.
		// The path to where our Terraform code is located
		TerraformDir: "../..",

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"secret.tfvars"},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	})

	// website::tag::4::Clean up resources with "terraform destroy". Using "defer" runs the command at the end of the test, whether the test succeeds or fails.
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2::Run "terraform init" and "terraform apply".
	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualBranchName := terraform.Output(t, terraformOptions, "action_branch")
	actualRepoVisibility := terraform.Output(t, terraformOptions, "output_repo_action_visibility")

	// website::tag::3::Check the output against expected values.
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedBranchName, actualBranchName)
	assert.Equal(t, expectedRepoVisibility, actualRepoVisibility)
}