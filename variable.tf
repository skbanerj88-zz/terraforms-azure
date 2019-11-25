variable "workspace_to_environment_map" {
	

	default = {
		dev = "dev"
		qa  = "qa"
	}
}

variable "environment_to_size_map" {
	

	default = {
		dev = "small"
		qa  = "medium"
	}
}

variable "workspace_to_size_map" {
	

	default = {
		dev = "small"
	}
}
