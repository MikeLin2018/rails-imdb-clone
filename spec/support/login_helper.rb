module Login_helper
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in User.create(name: 'admin',
                          email: 'admin@test.com',
                          password: 'password',
                          password_confirmation: "password",
                          admin: true)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in User.create(name: 'user',
                          email: 'user@test.com',
                          password: 'password',
                          password_confirmation: "password",
                          admin: false)
    end
  end
end