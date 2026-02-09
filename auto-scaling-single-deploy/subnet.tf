data aws_subnets "allsubs" {
}
output "allsubnets" {
	value=data.aws_subnets.allsubs.ids
}
