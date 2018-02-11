require 'rails_helper'

RSpec.describe "admin/sellings/new", type: :view do
  before(:each) do
    assign(:admin_selling, Admin::Selling::Payment::Payment.new(
      :order/order => nil,
      :amount => 1.5,
      :trans_id => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new admin_selling form" do
    render

    assert_select "form[action=?][method=?]", admin_selling_payment_payments_path, "post" do

      assert_select "input#admin_selling_order/order_id[name=?]", "admin_selling[order/order_id]"

      assert_select "input#admin_selling_amount[name=?]", "admin_selling[amount]"

      assert_select "input#admin_selling_trans_id[name=?]", "admin_selling[trans_id]"

      assert_select "input#admin_selling_status[name=?]", "admin_selling[status]"
    end
  end
end
