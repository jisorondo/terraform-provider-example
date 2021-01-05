Sample Terraform Provider
===

This repo just contains a simple (and useless) terraform provider. This code was originally based off of github.com/hashicorp/terraform-provider-scaffolding, though it's been modified so much, I don't know if any of the original code samples remain.

The purpose here is just to show the simplest implementation that actually fulfills all of the requirements (CRUD for the resource and read for the data source). It was a learning experience for me, and I'm making this repo public so that other people have something to look at if they need a simple example.

## How to use this

Like this:
    
    git clone git@github.com:jensenak/terraform-provider-example.git
    cd terraform-provider-example/
    go build -o ~/.terraform.d/plugins/adamcodes.net/terraform-provider-example/file/0.0.1/darwin_amd64/terraform-provider-file_v0.0.1
    cd example
    terraform init
    terraform plan
    terraform apply

That's pretty much it.

A few notes about the commands above:

- The build command outputs the artifact in a specific location. The location above is for unix-based systems (not Windows).
  - `~/.terraform.d/plugins` is one of the places that terraform will look for local plugins that aren't in the registry.
  - `adamcodes.net/terraform-provider-example/file` follows the pattern `{domain}/{project}/{provider}` and the domain doesn't need to be real.
  - `0.0.1/darwin_amd64` is the version of the plugin and the architecture it's built for. Change these according to your needs.
  - The file name `terraform-provider-file_v0.0.1` follows the pattern `terraform-provider-{provider_name}_v{version}`. You must always do this.
- The `required_providers` block in the `example/main.tf` file should always have a source path that matches the location of your build in `~/.terraform.d/plugins`.

## Relevant Documents

These docs helped me figure out the local path. The second contains guidance for Windows as well.

https://www.terraform.io/docs/configuration/provider-requirements.html
https://www.terraform.io/docs/commands/cli-config.html#implied-local-mirror-directories