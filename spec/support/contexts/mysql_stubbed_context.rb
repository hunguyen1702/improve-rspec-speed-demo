RSpec.shared_context "mysql2 stubbed setup" do
  def without_foreign_key_checks
    ActiveRecord::Base.connection.execute("SET foreign_key_checks = 0;")
    yield
  ensure
    ActiveRecord::Base.connection.execute("SET foreign_key_checks = 1;")
  end

  around(:example){|ex|without_foreign_key_checks &ex}
end
