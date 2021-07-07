class CategoryValidator < ActiveModel::Validator
    def validate(record)
        if record.category.any? == %w(comment tag image update)
            record.errors[:category] << "Not an acceptable category!!!"
        end
    end
end