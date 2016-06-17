class Quest < ActiveRecord::Base
	acts_as :gamification

	has_many :user_relationships, class_name: "QuestRelationship",
																foreign_key: "challenger_id",
																dependent: :destroy

	has_many :challengeds, through: :user_relationships, source: :challenged
	
# :nocov:
	def self.parse_quests
		quests = [["Seguir 10 deputados", 100, "Siga 10 deputados"],
		["Entre 5 vezes", 150, "Você deve entrar no app 5 vezes"],
		["Siga Baleia Rossi", 500, "Você deve seguir o deputado Baleia Rossi"],
		["Siga família Bolsonaro", 250, "Você deve seguir Bolso"],
		["Siga Jean Wyllys", 150, "Você deve seguir Jean Wyllys"],
		["Entre 10 vezes", 300, "Você deve entrar no app 10 vezes"],
		["Suba de level", 100, "Você deve evoluir um level"],
		["Suba 10 leveis", 500, "Você deve evoluir 10 leveis"],
		["Complete 10 achievements", 1000, "Você deve completar 10 achievements"],
		["Siga um deputado do PT", 100, "Você deve seguir um deputado do PT"]]

		if Quest.all.length >= 10
			puts "Base de quests já populada!"
		else
			quests.each do |quest|
				new_quest = Quest.new(:name => quest[0], :experience_points => quest[1],
				:description => quest[2])
				if new_quest.save
					puts "Quest :" + quest[0] + " Adicionada"
				end
			end
		end
	end
# :nocov:
end
