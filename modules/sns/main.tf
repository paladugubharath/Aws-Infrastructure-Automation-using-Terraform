variable "sns_email" {}

resource "aws_sns_topic" "topic" {
  name = "devops-topic"
}

resource "aws_sns_topic_subscription" "sub" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.sns_email
}