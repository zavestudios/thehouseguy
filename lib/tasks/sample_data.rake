namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    require 'faker'

		20.times do 
      Post.create(
        { 
          title: Faker::Book.title,
					body: Faker::Lorem.paragraph(40, false, 4)
        }
      )
		end
	end
end
