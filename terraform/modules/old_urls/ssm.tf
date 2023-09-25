data "aws_ssm_parameter" "scraping_layer_arn" {
  name = "/Golden/Layer/Scraping"
}
