package main

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	"github.com/jensenak/terraform-provider-example/file"
)

func main() {
	opts := &plugin.ServeOpts{ProviderFunc: file.Provider}

	plugin.Serve(opts)
}
