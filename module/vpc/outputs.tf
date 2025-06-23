output "vpc_id"       { value = aws_vpc.this.id }
output "subnet_id"    { value = aws_subnet.public.id }
output "public_cidr"  { value = aws_subnet.public.cidr_block }

