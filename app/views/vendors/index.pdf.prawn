prawn_document(:page_layout => :portrait) do |pdf|

  @vendors.each { |vendor| 
  pdf.text vendor.company_name 
  :plain
  pdf.text vendor.product}
end