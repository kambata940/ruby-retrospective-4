def fibonacci_formula(index_of_term, first_term)
  return first_term if index_of_term == 1
  return 1 if index_of_term == 2
  fibonacci_formula(index_of_term - 1, first_term) +
  fibonacci_formula(index_of_term - 2, first_term)
end
def series(name, index_of_term)
  return fibonacci_formula(index_of_term, 1) if name == 'fibonacci'
  return fibonacci_formula(index_of_term, 2) if name == 'lucas'
  fibonacci_formula(index_of_term, 1) + fibonacci_formula(index_of_term, 2)
end