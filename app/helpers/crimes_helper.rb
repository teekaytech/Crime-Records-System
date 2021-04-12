module CrimesHelper
  def check_category(category)
    category.nil? ? true : false
  end
end
