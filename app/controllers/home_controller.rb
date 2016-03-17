class HomeController < ApplicationController
	def index
			last = Person.all.order(created_at: :desc)
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

	def home
			last = Person.all.order(created_at: :desc)
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

	def getinfo
			last = Person.all.order(created_at: :desc)
			@pp = []
			k = 0
			render1 = ""
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
					render1 += '|'+'<div class="card profile-view">
                                <div class="pv-header">
                                    <img src="'+@pp[k][6]+'" class="pv-main" alt="">
                                </div>

                                <div class="pv-body">
                                    <h2> '+@pp[k][3]+' </h2>
                                    <small>Cette Personne a été reconnu avec un taux de '+@pp[count][2]+'%</small>

                                    <ul class="pv-contact">
                                        <li><i class="zmdi zmdi-pin"></i> '+@pp[k][1]+'      </li>
                                        <li><i class="zmdi zmdi-phone"></i> '+@pp[k][5]+'       </li>
                                        <li><i class="zmdi zmdi-broken-image"></i> '+@pp[k][2]+'      %</li>
                                    </ul>
                                    
                                    <ul class="pv-follow">
                                      <a href="'+@pp[k][4]+'" target="_blanck">LinkedIN</a>
                                    </ul>
                                    
                                </div>
                              </div>'
				rescue
					@pp[k][0] = 1
					render1 += '|'+'<div class="card profile-view">
                                <div class="pv-header">
                                    <img src="http://www.babelio.com/users/AVT_Unknown_340.gif" class="pv-main" alt="">
                                </div>

                                <div class="pv-body">
                                    <h2>UNKNOWN</h2>
                                    <small>une personne non reconnu a été rencontré%</small>

                                    <ul class="pv-contact">
                                    </ul>
                                    
                                    <ul class="pv-follow">
                                    </ul>
                                    
                                </div>
                              </div>'

				end
				k += 1
			end
			@str = "une erreur non reconnu a été rencontré"
			@strs = "une personne non reconnu a été rencontré"
			@nbr = k
			@a = 1
			render render1
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

