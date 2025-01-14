resource "newrelic_alert_policy" "foo" {
  name = "policy-one"
  incident_preference = "PER_POLICY" # PER_POLICY is default
}

# data "newrelic_entity" "app" {
#   name = "my-app"
#   type = "APPLICATION"
#   domain = "APM"
# }

# resource "newrelic_alert_policy" "foo" {
#   name = "foo"
# }

# resource "newrelic_alert_condition" "foo" {
#   policy_id = newrelic_alert_policy.foo.id

#   name        = "foo"
#   type        = "apm_app_metric"
#   entities    = [data.newrelic_entity.app.application_id]
#   metric      = "apdex"
#   runbook_url = "https://www.example.com"
#   condition_scope = "application"

#   term {
#     duration      = 5
#     operator      = "below"
#     priority      = "critical"
#     threshold     = "0.75"
#     time_function = "all"
#   }
# }

# resource "newrelic_alert_policy" "foo" {
#   name = "foo"
# }

resource "newrelic_nrql_alert_condition" "foo" {
  account_id                     = 4391334
  policy_id                      = newrelic_alert_policy.foo.id
  type                           = "static"
  name                           = "foo"
  description                    = "Alert when transactions are taking too long"
  runbook_url                    = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = "SELECT average(duration) FROM Transaction where appName = 'my-app'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}