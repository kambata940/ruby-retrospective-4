def formula(name, index)
  first_term = {'fibonacci' => 1, 'lucas' => 2}
  return first_term[name] if index == 1
  return 1 if index == 2

  formula(name, index - 1) + formula(name, index - 2)
end

def series(name, index)
  if name == 'summed'
    formula('fibonacci', index) + formula('lucas', index)
  else
    formula(name, index)
  end
end
