module "newrelic_alert_policy" {
  source = "./newrelic_alert_policy"
  api_key = "NRAK-3BS5GV3F4YPRM7QYP7AQD7QO52G"
}

module "dashboard" {
  source = "./dashboard"
 api_key = "NRAK-3BS5GV3F4YPRM7QYP7AQD7QO52G"
}