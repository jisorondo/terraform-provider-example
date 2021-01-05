terraform {
    required_providers {
        file = {
            source = "adamcodes.net/terraform-provider-example/file"
            version = ">= 0.0.8"
        }
    }
}

provider "file" {
    directory = "${module.path}/"
}

data "file_data_source" "source" {
    filename = "source.txt"
}

resource "file_resource" "dest" {
    filename = "dest.txt"
    file_content = "This is what we read: ${data.file_data_source.source.file_content}"
}