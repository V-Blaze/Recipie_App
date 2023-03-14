class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # allow all users to read recipes
    can :read, :all # everyone can read everything

    # allow logged-in users to create recipes
    can :create, Recipe if user.persisted?

    # allow users to update and destroy their own recipes
    can [:update, :destroy], Recipe, user_id: user.id
  end
end
