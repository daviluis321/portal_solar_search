module ApplicationHelper
  def search_for_select
    [
      ['Fabricante', 'manufacturer'],
      ['Material', 'structure_type'],
      ['Kwp', 'kwp'],
      ['Preco', 'price'],
    ]
  end
end