provider "aws" {
  region = "eu-west-1"
}

resource "aws_elastic_beanstalk_application" "appli" {
  name        = "java-application"
  description = "Deploy Elastic Beanstalk application"
}

resource "aws_elastic_beanstalk_environment" "appli" {
  name                = "example-environment"
  application         = aws_elastic_beanstalk_application.appli.name
  solution_stack_name = "Docker running on 64bit Amazon Linux 2"
  tier                = "WebServer"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
}
