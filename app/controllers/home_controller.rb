class HomeController < ApplicationController
	def index
		begin
			last = Person.all.last
			per = Finded.find_by! name: last.name
			@category = last.category
			@confidence = last.confidence
			@name = last.name.tr("_", " ").upcase
			@linkedin = per.linkedin
			@phone = per.phone
			@picture = ""
			@a = 1
		rescue
			@str = "une personne non reconnu a été rencontré"
			@a = 0
		end
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

