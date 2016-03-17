class HomeController < ApplicationController
	def home
		last = Person.all.last
		per = Finded.find_by! name: last.name
		@category = last.category
		@confidence = last.confidence
		@name = last.name.tr("_", " ").upcase
		@linkedin = per.linkedin
		@phone = per.phone
		@picture = ""
	end
	def create
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
	end
end

