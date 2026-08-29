locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num if num % 2 == 0]
  firstnames     = [for person in var.objects_list : person.firstname]
  # astnames      = [for person in var.objects_list : person.lastname]

  fullnames = [
    for person in var.objects_list : "${person.firstname} ${person.lastname}"
  ]
}