#Create R53 records for the instances
resource "aws_route53_record" "expense_r53_records" {
  count = length(var.components)
  zone_id = var.zone_id
  name    = "${var.components[count.index]}-${var.r53_project_name}"
  type    = "A"
  ttl     = 10
  allow_overwrite = true
  records = [aws_instance.this[count.index].private_ip]
}

#Create R53 records for the fronted server-public access
resource "aws_route53_record" "expense_r53_record_Public" {
  count = contains(var.components, "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = var.public_r53_name
  type    = "A"
  ttl     = 10
  allow_overwrite = true
  records = [aws_instance.expense_instances[index(var.components, "frontend")].public_ip]
}