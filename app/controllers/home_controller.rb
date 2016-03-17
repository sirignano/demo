class HomeController < ApplicationController
	def index
			last = Person.all
			@pp = []
			k = 0
			last.each do |o|
				@pp[k] = []
				begin
					per = Finded.find_by! name: o.name
					@category = o.category
					@confidence = o.confidence
					@name = o.name.tr("_", " ").upcase
					@linkedin = per.linkedin
					@phone = per.phone
					@picture = ""
					@pp[k][0] = 0
					@pp[k][1] = o.category
					@pp[k][2] = o.confidence
					@pp[k][3] = o.name.tr("_", " ").upcase
					@pp[k][4] = per.linkedin.split('|')[0]
					@pp[k][5] = per.phone
					@pp[k][6] = per.linkedin.split('|')[1]
				rescue
					@pp[k][0] = 1

				end
				k += 1
			end
			@str = "une erreur non reconnu a été rencontré"
			@strs = "une personne non reconnu a été rencontré"
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

