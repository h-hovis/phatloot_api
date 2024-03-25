# frozen_string_literal: true

class ProductBlueprint < Blueprinter::Base
    identifier :id

    fields :name, :category, :price, :description, :image_url

    view :normal do
        association :user, blueprint: UserBlueprint, view: :normal
    end
end
