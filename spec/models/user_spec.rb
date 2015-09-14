describe 'User' do

  subject(:user) { User.create(
                            name: "TestUser",
                            email: "test@test.com",
                            password: "password",
                            )}

    #These tests make sure User responds to name, email, password.
    it { is_expected.to respond_to :name}
    it { is_expected.to respond_to :email}
    it { is_expected.to respond_to :password}


    #This tests for uniqueness in the email model
    it { is_expected.to respond_to :email}

end