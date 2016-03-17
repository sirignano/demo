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
					@pp[k] = []
					@pp[k][0] = 0
					@pp[k][1] = @category
					@pp[k][2] = @confidence
					@pp[k][3] = @name
					@pp[k][4] = @linkedin
					@pp[k][5] = @phone
					@pp[k][6] = @picture
				rescue
					@strs = "une personne non reconnu a été rencontré"
					@pp[k] = []
					@pp[k][0] = 1

				end
				k += 1
			end
			@nbr = k
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

