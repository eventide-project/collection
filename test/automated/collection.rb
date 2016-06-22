require_relative 'automated_init'

controls = InvestmentAccountComponent::Controls

context "Collection" do
  context "Adding a Member" do
    context "Member is an Assignable Type" do
      test "Ok"
    end

    context "Member is Not Assignable Type" do
      test "Is an error (ArgumentError)"
    end
  end
end
