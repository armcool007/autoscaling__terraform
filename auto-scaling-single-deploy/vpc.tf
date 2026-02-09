data aws_vpc "fetch" {
	default=true
}
output "vpc_detaitls" {
	value=data.aws_vpc.fetch.id
}
