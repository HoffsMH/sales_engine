require_relative 'test_helper.rb'
require_relative '../lib/repos/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  
  def setup
    @invoice_repository = InvoiceRepository.new('./fixtures/invoices.csv')
  end  
  def test_make_sure_we_can_instantiate
    assert @invoice_repository.class == InvoiceRepository
  end
  def test_we_can_make_instances_of_Invoice
    
    invoice_record = {:customer_id =>"340", :merchant_id => "3052", :status => "shipped", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}
    invoice = @invoice_repository.add_invoice(invoice_record)
    
    expected = "340"
    result = invoice.customer_id
    
    assert_equal expected,  result
  end
  def test_we_can_populate_invoices
    assert @invoice_repository.invoices.length > 20
  end
  def test_we_can_access_a_invoices_info_from_the_invoice_repo_class
    
    expected = 3
    result = @invoice_repository.invoices[10].customer_id
    
    assert_equal expected, result
  end
end