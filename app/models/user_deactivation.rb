class UserDeactivation < ActiveRecordCompose::Model
  def initialize(account)
    @account = account
    @profile = account.then { it.profile || it.build_profile }
    super()
    models.push(profile, destroy: true)
    models.push(account, destroy: true)
  end

  private

  attr_reader :account, :profile
end
