class AuthorsController < ApplicationController
    def index 
        @authors = Author.all 
    end
    def new 
        @author = Author.new 
    end
    def create 
        author = Author.create(author_params)
        if author.valid?

            redirect_to author_path
        else
            flash[:my_errors] = author.errors.full_messages
            redirect_to new_author_path
        end
    end

    private

    def author_params
        params.require(:author).permit(:name, :phone_number)
    end
end
