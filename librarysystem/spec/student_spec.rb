require "rails_helper"
RSpec.describe App::Student, :type => :model do
  describe '#return_id' do
    context "when app_user is employee" do
      it "should respond with true" do
        studet = App::Student.create!(name: 'Jim', email: 'ggg@gg.com', app_user_type: 1)
        expect(app_user.is_employee?).to eq(false)
      end
    end
    context "when app_user is not employee" do
      it "should respond with false" do
        app_user = App::User.create!(true_name: '王先生', mobile: '13700000000', app_user_type: 21)
        expect(app_user.is_employee?).to eq(true)
      end
    end
  end
end