resource "aws_launch_template" "lt" {
  image_id = var.ami_id
  instance_type = "t3.micro"
  key_name = var.key_name

  vpc_security_group_ids = [var.sg_id]
}

resource "aws_autoscaling_group" "asg" {
  min_size = 1
  max_size = 2
  desired_capacity = 1

  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [var.target_group]

  launch_template {
    id = aws_launch_template.lt.id
    version = "$Latest"
  }
}

