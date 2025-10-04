class User < ActiveRecordCompose::Model
  def initialize(account = nil, attributes = {})
    # normalize arguments order.
    if account.respond_to?(:to_hash)
      account, attributes = nil, account
    end

    @account = account || Account.new
    @profile = @account.then { it.profile || it.build_profile }
    super(attributes)
    models << account << profile
  end

  delegate :id, :persisted?, to: :account

  delegate_attribute :email, to: :account
  delegate_attribute :name, :age, to: :profile

  private

  attr_reader :account, :profile
end
