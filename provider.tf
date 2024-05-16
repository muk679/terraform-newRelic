terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.36.0"
    }
  }
}

provider "newrelic" {
  # Configuration options
  account_id = 4391334
  region = "US"
  api_key = "NRAK-3BS5GV3F4YPRM7QYP7AQD7QO52G"
}



