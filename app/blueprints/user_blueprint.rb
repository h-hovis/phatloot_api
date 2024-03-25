# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :first_name, :last_name, :email, :username
    end

    view :products do
        association :products, blueprint: ProductBlueprint, view: :normal
    end
end