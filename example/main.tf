terraform {
    required_providers {
        file = {
            source = "xtfe.havananet.us/havananet/filetest"
            version = ">= 0.0.1"
        }
    }
}

provider "file" {
    directory = "${path.module}/"
}

data "file_data_source" "source" {
    filename = "source.txt"
}

resource "file_resource" "dest" {
    filename = "dest.txt"
    file_content = "This is what we read: ${data.file_data_source.source.file_content}"
}
