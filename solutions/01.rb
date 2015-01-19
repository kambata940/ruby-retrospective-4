def formula(first_term, nth)
  return first_term if nth == 1
  return 1 if nth == 2

  formula(nth - 1, first_term) + formula(nth - 2, first_term)
end

def series(name, nth)
  choose = {'fibonacci' => 1, 'lucas' => 2}
  return formula(nth, choose[name])
  
  formula(1, nth) + formula(2, nth)
end
