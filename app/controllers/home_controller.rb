class HomeController < ApplicationController
	def index
			last = Person.all
			@pp = []
			k = 0
			last.each do |o|
				begin
					per = Finded.find_by! name: o.name
					@category = o.category
					@confidence = o.confidence
					@name = o.name.tr("_", " ").upcase
					@linkedin = per.linkedin
					@phone = per.phone
					@picture = ""
					@pp[k]["category"] = @category
					@pp[k]["confidence"] = @confidence
					@pp[k]["name"] = @name
					@pp[k]["linkedin"] = @linkedin
					@pp[k]["phone"] = @phone
					@pp[k]["picture"] = @picture
					@pp[k]["a"] = 0
				rescue
					@strs = "une personne non reconnu a été rencontré"
					@pp[k]["a"] = 1

					@a = 0
				end
				k += 1
			end
			@a = 1
	end

	def create
		begin
			rec = params[:data]
			tab = JSON.parse(rec)
			tab.each do |t|
				a = Person.new
				a.category = t["category"]
				a.confidence = t["confidence"]
				a.name = t["name"]
				a.save
			end
			render plain: "OK"
		rescue
			render plain: "KO"
		end
	end
end

