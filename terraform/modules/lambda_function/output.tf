output "function_name" {
  value = aws_lambda_function.function.function_name
}

output "alias_name" {
  value = aws_lambda_alias.function.name
}

output "alias_arn" {
  value = aws_lambda_alias.function.arn
}