class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
	end
	
	def create?
		binding.pry
    @user.journalist?
  end
end