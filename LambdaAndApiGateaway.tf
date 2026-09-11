resource "aws_iam_role" "lambda" {
    //name of role
  name = "lambda-role"
  //Policy Put into Terraform Format 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "lambda.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_lambda_function" "api" {
  function_name = "terraform-api"
  role          = aws_iam_role.lambda.arn
  handler       = "index.handler"
  runtime       = "python3.12"

  filename = "lambda.zip"
}

resource "aws_apigatewayv2_api" "api" {
  name          = "terraform-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id = aws_apigatewayv2_api.api.id

  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.api.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "root" {
  api_id = aws_apigatewayv2_api.api.id

  route_key = "GET /"

  target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

//Infasructure Layout: Creating AWS IAM role Lambda + Lambda Function Which Uses an API + 